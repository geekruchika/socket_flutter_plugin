import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:socket_flutter_plugin/socket_flutter_plugin.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    
      SocketFlutterPlugin myIO = new SocketFlutterPlugin();
      myIO.socket("https://stream.automatic.com?token=20a2eee3a9ceb9a11422:b95e6f30cd35b4feb8fca33b66426b58e04ab175");
      myIO.connect();
      String jsonData =
              '{"content":"test"}';
     // myIO.emit("chat",jsonData);
      myIO.on("ignition:on",(data){
        print("i m here data");
      }).then((v){
        print("i m here");
      });
      myIO.on("ignition:off",(data){
        print(data);
      });
    
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Plugin example app'),
        ),
        // body: new Center(
        //   child: new Text('Running on: $_platformVersion\n'),
        // ),
      ),
    );
  }
}
