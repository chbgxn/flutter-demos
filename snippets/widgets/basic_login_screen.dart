/*
- [EN] Implement A Basic Login Interface
- Introductions:
- The front-end uses Flutter's Form to process input and interaction, achieving information verification 
and keyboard interaction.
- Use Dio to call the Node.js cloud function written by myself in Tencent CloudBase.
- The database uses CloudBase's NoSQL to store user data.
- Implemented information prompts and login jumps.

- [ZH] 实现一个基本的登录界面
- 介绍：
- 前端使用 Flutter 的 Form 处理输入和交互，实现信息验证和键盘交互。
- 通过 Dio 调用腾讯 CloudBase 中自己编写的 Node.js 云函数。
- 数据库选用了 CloudBase 的 NoSQL 存储用户数据。
- 实现了信息提示，登录跳转。

- Author: chbgxn
*/

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:login_demo/successful_screen.dart';

class BasicLoginScreen extends StatefulWidget {
  const BasicLoginScreen({super.key});

  @override
  State<BasicLoginScreen> createState() => _BasicLoginScreenState();
}

class _BasicLoginScreenState extends State<BasicLoginScreen> {
  final _fromKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final FocusNode _idFocusNode = FocusNode();
  final FocusNode _pwdFocusNode = FocusNode();

  final _path = 'https://example.com'; //The domain name corresponding to the operation in Cloudbase 
                                      //[ZH]Cloudbase中的对应操作的域名

  Future<void> _fetchData() async{
    try{
      Dio dio = Dio();
      Response response = await dio.get(
        _path,
        queryParameters: {
          'id': _idController.text.trim(),
          'pwd': _pwdController.text.trim(),
        }
      );
      if(response.statusCode == 200){
        final jsonData = response.data;
        if(jsonData['code'] == '200'){
          if(mounted){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SuccessfulScreen()) //Information is correct, jump to homepage 
                                                                       //[ZH]信息无误跳转到主页
            );
          }
        }
        else{
          if(mounted){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text('账号不存在或者密码错误！')));
          } 
        }
      }
    }catch(e){
       if(mounted){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text('发生错误！')));
        } 
    }
    _idController.clear();
    _pwdController.clear();    
  }

  @override
  void dispose() {
    _idController.dispose();
    _pwdController.dispose();
    _idFocusNode.dispose();
    _pwdFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _fromKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            TextFormField(
              controller: _idController,
              focusNode: _idFocusNode,
              autovalidateMode: _idFocusNode.hasFocus
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
              decoration: InputDecoration(
                label: Text('用户ID'),
                prefix: Icon(Icons.people),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '用户编号不能为空！';
                }
                return null;
              },
              textInputAction: TextInputAction.next, //keyboard interaction [ZH]键盘交互
              onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_pwdFocusNode),
            ),

            TextFormField(
              controller: _pwdController,
              focusNode: _pwdFocusNode,
              autovalidateMode: _pwdFocusNode.hasFocus
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
              decoration: InputDecoration(
                label: Text('密码'),
                prefix: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '密码不能为空！';
                }
                return null;
              },
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => _pwdFocusNode.unfocus(),
            ),

            FormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              initialValue: false,
              validator: (value) {
                if(value == false){
                  return '必须同意协议！';
                }
                return null;
              },
              builder: (state){
                return CheckboxListTile(
                  title: Text('已阅读并同意《隐私权政策》《平台服务协议》'),
                  value: state.value,
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Colors.red,
                  onChanged: (bool? value){
                    state.didChange(value);
                  },
                  subtitle: state.hasError
                    ? Text(state.errorText!, style: TextStyle(color: Colors.red))
                    : null,
                );
              }
            ),
            
            OutlinedButton(
              onPressed: (){
                if(_fromKey.currentState!.validate()){  
                  _fetchData(); 
                }
              }, 
              child: const Text('登录')
            )
          ],
        ),
      ),
    );
  }
}
