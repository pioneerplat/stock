import 'package:flutter/material.dart';
import 'package:stock/model/common_size.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          SizedBox(height: common_l_gap),
          Center(
            child: Text(
              'STOCK',
              style: TextStyle(fontFamily: 'VeganStyle', fontSize: 30,),
            ),
          ),
          TextFormField(),
          TextFormField(),
          TextFormField(),
        ],
      ),
    );
  }
}
