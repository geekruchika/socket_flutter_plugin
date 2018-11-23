import 'dart:async';


import 'package:flutter/services.dart';

class SocketFlutterPlugin {

  MethodChannel _channel = const MethodChannel('socket_flutter_plugin');

  Future<String> socket(url,[token]) async {
    final String socket = await _channel.invokeMethod('socket',<String, dynamic>{'url': url, 'token': token});
    return socket;
  }

  Future<String> emit(topic, message) async {
    final String success = await _channel.invokeMethod('emit',<String, dynamic>{'message': message, 'topic': topic});
    return success;
  }

  Future<Null> connect() async {
      print("here connect");
    final String socket = await _channel.invokeMethod('connect');
  }


  Future<String> on(String topic, Function _handle) async {
    print("here hhhhhhhhhhhh");
    print(_channel);
    final String socket = await _channel.invokeMethod('on', <String, dynamic>{'topic': topic});
 print(socket);
    _channel.setMethodCallHandler((MethodCall call) {
     print("here call");
      if (call.method == 'received') {
        // print("hdjhgkjhdsgksj");
        // print(call);
       final String received = call.arguments["message"];
       
      // return received;
   Function.apply(_handle, [received]);
      }
      else print("m in else part here");
    });
    return socket;
  }

  Future<String> unsubscribe(topic) async {
    final String success = await _channel.invokeMethod('unsubscribe', <String, dynamic>{'topic': topic});
    return success;
  }
}
