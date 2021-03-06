import 'package:brighter/BrightnessController.dart';
import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Brighter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Brightness brightness = new Brightness();



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child:Row(
            children: [
              Text("Brightness"),
              Expanded(
                child:Slider(
                  value:brightness.getBrightness(),
                  min:0,
                  max:100,
                  label:brightness.getBrightness().round().toString(),
                  onChanged:(level){
                    setState(() {
                      // brightness.changeBrightness(level);
                      brightness.setBrightness(level);
                    });
                  }
                )
              ),
            ],
          ),
        ),
    );
  }
}
