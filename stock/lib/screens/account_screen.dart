import 'package:flutter/material.dart';
import 'package:stock/model/common_size.dart';
import 'package:stock/model/screen_size.dart';
import 'package:stock/widgets/account_body.dart';

//변수가 class 바깥에 정의되어 있으면 자동으로 static 변수가 되어서 바깥에서 접근이 가능하다
//static은 앱이 실행되면서 값이 생성 되는것이 아니라 앱이 실행됨과 동시에 값이 존재한다.
const duration = Duration(milliseconds: 500);

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  final menuWidth = size.width / 3 * 2;
  MenuStatus _menuStatus = MenuStatus.closed;
  double bodyXPos = 0;
  double menuXPos = size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Stack(
          children: [
            //Stack에서 코드작성시 먼저 작성될 수록 안으로 들어간다 (ex AccountBody가 가장 밑에 깔리게 된다)
            AnimatedContainer(
                duration: duration,
                curve: Curves.fastOutSlowIn,
                transform: Matrix4.translationValues(bodyXPos, 0, 0),
                child: AccountBody(onMenuChanged: () {
                  setState(() {
                    _menuStatus = (_menuStatus == MenuStatus.closed)
                        ? MenuStatus.opened
                        : MenuStatus.closed;

                    switch (_menuStatus) {
                      case MenuStatus.opened:
                        bodyXPos = -menuWidth;
                        menuXPos = size.width - menuWidth;
                        break;
                      case MenuStatus.closed:
                        bodyXPos = 0;
                        menuXPos = size.width;
                        break;
                    }
                  });
                })),
            Positioned(
              top: 0,
              bottom: 0,
              width: menuWidth,
              child: AnimatedContainer(
                  duration: duration,
                  curve: Curves.fastOutSlowIn,
                  transform: Matrix4.translationValues(menuXPos, 0, 0),
                  child: Container(
                    color: Colors.red,
                  )),
            ),
          ],
        ));
  }
}

enum MenuStatus { opened, closed }
