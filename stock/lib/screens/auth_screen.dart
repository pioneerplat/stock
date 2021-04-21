import 'package:flutter/material.dart';
import 'package:stock/widgets/sign_in_form.dart';
import 'package:stock/widgets/sign_up_form.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  List<Widget> forms = [SignUpForm(), SignInForm()];
  int selectedForm = 0;

  Widget currentWidget;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: <Widget>[
          IndexedStack(
            index: selectedForm,
            children: forms,
          ),
          //Positioned 는 Stack안에서만 사용할 수 있다.
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 45,
            child: Container(
              color: Colors.white,
              child: FlatButton(
                shape: Border(top: BorderSide(color: Colors.grey)),
                onPressed: () {
                  setState(() {
                    if (selectedForm == 0) {
                      selectedForm = 1;
                    } else {
                      selectedForm = 0;
                    }
                  });
                },
                child: RichText(
                  text: TextSpan(
                    text: (selectedForm == 0)
                        ? "이미 계정이 있습니까?  "
                        : "계정을 가지고 있지 않습니까?  ",
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                          text: (selectedForm == 0) ? "로그인하기" : "계정만들기",
                          style: TextStyle(color: Colors.black45,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
