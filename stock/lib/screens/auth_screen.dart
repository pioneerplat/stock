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
        child: Stack(
          children: <Widget>[
            IndexedStack(
              index: selectedForm,
              children: forms,
              ),
            Container(
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    if (selectedForm == 0) {
                      selectedForm = 1;
                    } else {
                      selectedForm = 0;
                    }
                  });
                },
                child: Text("go to Sign up"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
