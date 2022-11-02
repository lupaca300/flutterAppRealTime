import 'package:flutter/material.dart';
import 'package:flutter_application_realtime/mainSendMessage/divSendMessage.dart';

class barButtonsWorkAreas extends StatelessWidget {
  var office;
  barButtonsWorkAreas({Key? key, required this.office}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeBarButtonsArWorks(
      office: office,
    );
  }
}

class HomeBarButtonsArWorks extends StatefulWidget {
  var office;
  HomeBarButtonsArWorks({super.key, required this.office});

  @override
  State<HomeBarButtonsArWorks> createState() => _HomeBarButtonsArWorksState();
}

class _HomeBarButtonsArWorksState extends State<HomeBarButtonsArWorks> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          if (widget.office.toString() == "Servicios Academicos")
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DivSendMessage(
                                  office: "Administracion",
                                )));
                  },
                  child: Text("Administracion")),
            ),
          if (widget.office.toString() == "Administracion")
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DivSendMessage(
                                  office: "Servicios Academicos",
                                )));
                  },
                  child: Text("Servicios Academicos")),
            ),
        ],
      ),
    );
  }
}
