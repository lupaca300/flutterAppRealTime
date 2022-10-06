import 'package:flutter/material.dart';
import 'package:flutter_application_realtime/mainSendMessage/main_send_messsage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_realtime/mainSendMessage/main_send_messsage.dart';

class MainOfficeUser extends StatelessWidget {
  const MainOfficeUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeMainOfficeUser());
  }
}

class HomeMainOfficeUser extends StatefulWidget {
  HomeMainOfficeUser({Key? key}) : super(key: key);

  @override
  State<HomeMainOfficeUser> createState() => _HomeMainOfficeUserState();
}

class _HomeMainOfficeUserState extends State<HomeMainOfficeUser> {
  final firebasedb = FirebaseDatabase.instance.ref();

  leer() {
    print("estamos en leer");
    firebasedb.child("Servicios Academicos").onChildAdded.listen((event) {
      print(event.snapshot.value);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
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
          body: TabBarView(children: [
            ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => Card(
                      child: ListTile(
                        title: Text("cargamento numero 1"),
                        subtitle: Text(
                            "hola como etasssssssssssssssssssssssssssssssssssssssss"),
                      ),
                    )),
            MainSendMessage(),
            Center(
                child: ElevatedButton(onPressed: () {}, child: Text("data"))),
          ]),
        ));
  }
}
