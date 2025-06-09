/*
- [EN] Implement A Basic Login Page
- Introductions:
- The front-end uses Flutter's Form to process input and interaction,
achieving information verification and keyboard interaction.
- Call CloudBase's Node.js cloud function through Dio.
- The database uses CloudBase's NoSQL to store user data.
- Implemented information prompts and login redirection.

- [ZH] 实现一个基本的登录界面
- 介绍：
- 前端使用Flutter的Form处理输入和交互，实现信息验证和键盘交互。
- 通过Dio调用CloudBase的Node.js云函数。
- 数据库选用了CloudBase的NoSQL存储用户数据。
- 实现了信息提示，登录跳转。

- Author: @chbgxn
*/

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:today_news_app/successful_page.dart';

class BasicLoginPage extends StatefulWidget {
  const BasicLoginPage({super.key});

  @override
  State<BasicLoginPage> createState() => _BasicLoginPageState();
}

class _BasicLoginPageState extends State<BasicLoginPage> {
  final _fromKey = GlobalKey<FormState>();
  final TextEditingController _uidController = TextEditingController();
  final TextEditingController _upwdController = TextEditingController();
  final FocusNode _uidFocusNode = FocusNode();
  final FocusNode _upwdFocusNode = FocusNode();

  final _path = 'https://example.com'; //The domain name corresponding to the operation in Cloudbase 
                                      //[ZH]Cloudbase中的对应操作的域名

  Future<void> _fecthData() async{
    try{
      Dio dio = Dio();
      Response response = await dio.get(
        _path,
        queryParameters: {
          'id': _uidController.text.trim(),
          'pwd': _upwdController.text.trim(),
        }
      );
      if(response.statusCode == 200){
        final jsonData = response.data;
        if(jsonData['code'] == '200'){
          if(mounted){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> SuccessfulPage()) //Information is correct, jump to homepage 
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
    _uidController.clear();
    _upwdController.clear();    
  }

  @override
  void dispose() {
    _uidController.dispose();
    _upwdController.dispose();
    _uidFocusNode.dispose();
    _upwdFocusNode.dispose();
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
              controller: _uidController,
              focusNode: _uidFocusNode,
              autovalidateMode: _uidFocusNode.hasFocus?
                AutovalidateMode.onUserInteraction:
                AutovalidateMode.disabled,
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
              onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_upwdFocusNode),
            ),

            TextFormField(
              controller: _upwdController,
              focusNode: _upwdFocusNode,
              autovalidateMode: _upwdFocusNode.hasFocus?
                AutovalidateMode.onUserInteraction:
                AutovalidateMode.disabled,
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
              onFieldSubmitted: (_) => _upwdFocusNode.unfocus(),
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
                  subtitle: state.hasError?
                    Text(state.errorText!, style: TextStyle(color: Colors.red)):null,
                );
              }
            ),
            
            OutlinedButton(
              onPressed: (){
                if(_fromKey.currentState!.validate()){  
                  _fecthData(); 
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
