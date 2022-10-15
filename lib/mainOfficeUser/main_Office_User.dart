import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_realtime/mainSendMessage/main_send_messsage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_realtime/mainSendMessage/main_send_messsage.dart';

class MainOfficeUser extends StatelessWidget {
  var officeStateless;
  MainOfficeUser({
    super.key,
    required this.officeStateless,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomeMainOfficeUser(
      office: officeStateless,
    ));
  }
}

class HomeMainOfficeUser extends StatefulWidget {
  var office;
  HomeMainOfficeUser({Key? key, required this.office}) : super(key: key);

  @override
  State<HomeMainOfficeUser> createState() => _HomeMainOfficeUserState();
}

class _HomeMainOfficeUserState extends State<HomeMainOfficeUser> {
  final firebasedb = FirebaseDatabase.instance.ref();
  var listThings = [];

  leer() async {
    print("estamos en leer");
    print(widget.office.toString());
    await firebasedb
        .child(widget.office.toString())
        .onChildAdded
        .listen((event) {
      print(event.snapshot.value);
      Map<String, dynamic> data = jsonDecode(jsonEncode(event.snapshot.value));
      print(data.keys);
      print(data.values);
      print(event.snapshot.key);
      listThings.add({event.snapshot.key.toString(): event.snapshot.value});
      print(listThings);
    });
    setState(() {
      print(listThings);
      listThings;
    });
  }

  @override
  void initState() {
    super.initState();
    leer();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(tabs: [
              Tab(icon: Icon(Icons.message)),
              Tab(icon: Icon(Icons.send)),
              Tab(icon: Icon(Icons.home_work))
            ]),
          ),
          body: TabBarView(children: <Widget>[
            ListView.builder(
                itemCount: listThings.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    trailing: PopupMenuButton(
                      itemBuilder: (context) => [],
                    ),
                    title: Text(
                        listThings[index].values.first['titulo'].toString()),
                    subtitle: Text(
                        listThings[index].values.first['message'].toString()),
                  );
                }),
            MainSendMessage(),
            Center(
                child: ElevatedButton(onPressed: () {}, child: Text("data"))),
          ]),
        ));
  }
}
