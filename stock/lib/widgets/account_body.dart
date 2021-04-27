import 'package:flutter/material.dart';
import 'package:stock/model/common_size.dart';
import 'package:stock/screens/account_screen.dart';

class AccountBody extends StatefulWidget {

  //함수 선언
  final Function() onMenuChanged;

  const AccountBody({Key key, this.onMenuChanged}) : super(key: key);

  @override
  _AccountBodyState createState() => _AccountBodyState();
}

class _AccountBodyState extends State<AccountBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _appbar(),
          _username(),
        ],
      ),
    );
  }

  Row _appbar() {
    return Row(
      children: [
        SizedBox(
          width: 48,
        ),
        Expanded(
            child: Text(
              'Account',
              textAlign: TextAlign.center,
            )),
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            widget.onMenuChanged();
          },
        )
      ],
    );
  }

  Widget _username() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text(
        'username',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }


}
