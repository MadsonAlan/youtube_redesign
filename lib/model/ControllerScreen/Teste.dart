import 'package:flutter/material.dart';
import 'package:youtube_redesign/model/ControllerScreen/Start.dart';

class Controlador extends StatefulWidget {
  @override
  _ControladorState createState() => _ControladorState();
}

class _ControladorState extends State<Controlador> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: new Start(),
    );
  }
}
