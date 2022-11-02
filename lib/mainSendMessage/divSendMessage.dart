import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DivSendMessage extends StatefulWidget {
  var office;
  DivSendMessage({super.key, required this.office});

  @override
  State<DivSendMessage> createState() => _homeDivSendMessageState();
}

class _homeDivSendMessageState extends State<DivSendMessage> {
  final firebasedb = FirebaseDatabase.instance.ref();
  TextEditingController txt = new TextEditingController();
  TextEditingController txtTitle = new TextEditingController();

  enviarMensaje(value, valueText) {
    firebasedb.child(widget.office.toString()).push().set({
      "message": value.toString(),
      "titulo": valueText.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        TextFormField(
          controller: txt,
          textAlign: TextAlign.center,
          maxLines: 10,
          decoration: InputDecoration(
              fillColor: Colors.amber,
              border: InputBorder.none,
              hintText: 'Please enter a title'),
        ),
        TextFormField(
          controller: txtTitle,
          textAlign: TextAlign.center,
          maxLines: 2,
          decoration: InputDecoration(
              fillColor: Colors.amber,
              border: InputBorder.none,
              hintText: 'Please enter a searcxh term'),
        ),
        ElevatedButton(
            onPressed: () async {
              await enviarMensaje(txt.text, txtTitle.text);
              txt.clear();
              txtTitle.clear();
              print(txt.text);
            },
            child: Text("ENVIAR")),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("CANCELAR"))
      ],
    )));
  }
}
