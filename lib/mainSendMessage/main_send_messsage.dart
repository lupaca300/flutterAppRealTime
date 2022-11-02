import 'package:flutter/material.dart';
import 'package:flutter_application_realtime/mainSendMessage/bar_Buttons_WorkAreas.dart';

class MainSendMessage extends StatelessWidget {
  var office;
  MainSendMessage({Key? key, required this.office}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return barButtonsWorkAreas(
      office: office,
    );
  }
}
