import 'package:flutter/material.dart';

class barButtonsWorkAreas extends StatelessWidget {
  const barButtonsWorkAreas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(onPressed: () {}, child: Text("Servicios Academicos")),
          ElevatedButton(onPressed: () {}, child: Text("Administracion")),
          ElevatedButton(onPressed: () {}, child: Text("Area Academica"))
        ],
      ),
    );
  }
}
