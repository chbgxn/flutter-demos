import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _fromKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _idController,
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
            ),

            SizedBox(height: 16),

            TextFormField(
              controller: _pwdController,
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
            ),

            SizedBox(height: 16),

            FormField(
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
                    Text(state.errorText!, style: TextStyle(color: Colors.red)):
                    null,
                );
              }
            ),

            SizedBox(height: 16),
            
            OutlinedButton(
              onPressed: (){
                if(_fromKey.currentState!.validate()){
                  //验证通过后，比较输入的文本和数据库的数据
                }
              }, 
              child: Text('登录')
            )
          ],
        ),
      ),
    );
  }
}
