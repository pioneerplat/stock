import 'package:flutter/material.dart';
import 'package:stock/home_page.dart';
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
    //textfiled가 서로거리가 떨어져있어 키보드를 올렸을때 밑에 textfiled가 보이지 않을때 스크롤로 밑에 textfiled를 보기 위해
    //Scaffold로 감싸서 resizeToAvoidBottomInset옵션을 true로 준다 
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
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
                onPressed: () {
                  //3가지 validator가 모두 return null을 하면 true가 오고 그렇지 않으면 false가 온다
                  if (_formKey.currentState.validate()) {
                    print('Validation success!!');
                    //Navigator라는 클래스를 사용해서 instance를 가져와서 해당 instance를 통해서 화면을 바꿈
                    //pushReplacement 해당화면으로 가면서 현재화면은 없앤다
                    //push를 하면 현재화면을 뒤로보내고 해당화면을 가지고 옴
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage()));
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
      ),
    );
  }

  InputDecoration _textInputDecor(String hint) {
    return InputDecoration(
        hintText: hint,
        enabledBorder: _activeInputBorder(),
        focusedBorder: _activeInputBorder(),
        errorBorder: _errorInputBorder(),
        focusedErrorBorder: _errorInputBorder(),
        filled: true,
        fillColor: Colors.grey[100]);
  }

  OutlineInputBorder _activeInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[300]),
        borderRadius: BorderRadius.circular(common_s_gap));
  }

  OutlineInputBorder _errorInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent),
        borderRadius: BorderRadius.circular(common_s_gap));
  }
}
