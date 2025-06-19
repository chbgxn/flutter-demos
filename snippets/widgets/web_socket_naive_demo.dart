/*
- [EN] A Simple WebSocket Echo Test
- Introductions:
- Through the WebSocket connection, text is sent to the server, server information is received, 
and the server returns the original text.
- It can verify whether the two-way communication of WebSocket is normal.
- ✅ Added the function of automatic reconnection after disconnection.

- [ZH] 一个简单的 WebSocket Echo 测试
- 介绍：
- 通过 WebSocket 连接，向服务器发送文本，接收服务器信息，服务器返回原样的文本。
- 可以验证 WebSocket 的双向通信是否正常。
- ✅ 增加了断线后自动重连的功能。

- Author: chbgxn
*/

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketNaiveDemo extends StatefulWidget {
  const WebSocketNaiveDemo({super.key});

  @override
  State<WebSocketNaiveDemo> createState() => _WebSocketNaiveDemoState();
}

class _WebSocketNaiveDemoState extends State<WebSocketNaiveDemo> {
  final TextEditingController _controller = TextEditingController();
  late StreamController _streamController;
  WebSocketChannel? _channel;
  final _url = 'wss://example.websocket.echo'; //example

  void _connect(){
    _channel = WebSocketChannel.connect(Uri.parse(_url));
    _channel!.stream.listen(
      (message) => _streamController.add(message),
      onDone: () => _reconnect(),
    );
  }

  @override
  void initState() {
    super.initState();
    _streamController = StreamController.broadcast();
    _connect();
  }

//✅ automatic reconnection [ZH]✅ 自动重连
  Future<void> _reconnect() async {
    await Future.delayed(Duration(seconds: 2));
    _connect();
  }

  void _sendMessage(){
    if(_controller.text.isNotEmpty && _channel != null){
      _channel!.sink.add(_controller.text.trim());
      _controller.clear();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _streamController.close();
    _channel?.sink.close();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '发送信息',
            ),
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => FocusScope.of(context).unfocus(),
          ),

          StreamBuilder(
            stream: _streamController.stream,
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Text('正在连接...');
              }
              if(snapshot.connectionState == ConnectionState.done){
                return const Text('连接已中断');
              }
              if(snapshot.hasError){
                return Text('error: ${snapshot.error}');
              }
              return Text('接收到的信息: ${snapshot.data}');
            }
          ),
         
          OutlinedButton(
            onPressed: _sendMessage,
            child: const Text('发送信息')
          )
        ],
      ),
    );
  }
}
