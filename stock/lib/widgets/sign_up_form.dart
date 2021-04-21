import 'package:flutter/material.dart';
import 'package:stock/model/common_size.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  TextEditingController _cpwController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    _cpwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(common_gap),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(height: common_l_gap),
            Center(
              child: Text(
                'STOCK',
                style: TextStyle(
                  fontFamily: 'VeganStyle',
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(height: common_l_gap),
            TextFormField(
              cursorColor: Colors.black54,
              controller: _emailController,
              decoration: _textInputDecor('Email'),
              //_emailController 에 입력된 text를 받아와서 email 폼이 맞는지 확인을 할 수 있다.
              validator: (text) {
                if (text.isNotEmpty && text.contains("@")) {
                  return null;
                } else {
                  return '정확한 이메일 주소를 입력해 주세요';
                }
              },
            ),
            SizedBox(
              height: common_xs_gap,
            ),
            TextFormField(
              cursorColor: Colors.black54,
              obscureText: true,
              controller: _pwController,
              decoration: _textInputDecor('Password'),
              //_emailController 에 입력된 text를 받아와서 email 폼이 맞는지 확인을 할 수 있다.
              validator: (text) {
                if (text.isNotEmpty && text.length > 5) {
                  return null;
                } else {
                  return '제대로 된 비밀번호를 입력해 주세요';
                }
              },
            ),
            SizedBox(
              height: common_xs_gap,
            ),
            TextFormField(
              cursorColor: Colors.black54,
              obscureText: true,
              controller: _cpwController,
              decoration: _textInputDecor('Confirm Password'),
              //_emailController 에 입력된 text를 받아와서 email 폼이 맞는지 확인을 할 수 있다.
              validator: (text) {
                if (text.isNotEmpty && text == _pwController.text) {
                  return null;
                } else {
                  return '비밀번호가 일치하지 않습니다.';
                }
              },
            ),
            FlatButton(
              color: Colors.red,
              onPressed: (){
                //3가지 validator가 모두 return null을 하면 true가 오고 그렇지 않으면 false가 온다
                if(_formKey.currentState.validate()){
                  print('Validation success!!');
                }
              },
              child: Text('Join', style: TextStyle(color: Colors.white),),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _textInputDecor(String hint) {
    return InputDecoration(
        hintText: hint,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300]),
            borderRadius: BorderRadius.circular(common_s_gap)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300]),
            borderRadius: BorderRadius.circular(common_s_gap)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent),
            borderRadius: BorderRadius.circular(common_s_gap)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent),
            borderRadius: BorderRadius.circular(common_s_gap)),
        filled: true,
        fillColor: Colors.grey[100]);
  }
}
