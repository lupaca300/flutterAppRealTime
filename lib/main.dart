import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_realtime/mainOfficeUser/main_Office_User.dart';
import 'package:flutter_application_realtime/mainSendMessage/main_send_messsage.dart';

//aplicacion con firebase RealTime
void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainOfficeUser(
                                officeStateless: "Servicios Academicos")));
                  },
                  child: Text("Servicios Academicos")),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainOfficeUser(
                                officeStateless: "Administracion")));
                  },
                  child: Text("Administracion")),
            ]),
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text("button 2")),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(onPressed: () {}, child: Text("button 4")),
              ],
            ),
          ],
        ),
      ))),
    );
  }
}
