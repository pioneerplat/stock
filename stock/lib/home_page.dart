import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock/model/screen_size.dart';
import 'package:stock/model/stock_state.dart';
import 'package:stock/screens/account_screen.dart';
import 'package:stock/screens/stock_screen.dart';

class HomePage extends StatefulWidget {
  StockState _stockState = StockState();
  @override
  _HomePageState createState() {
    _stockState.previousClosingPriceDate();
    Timer.periodic(Duration(seconds: 3), (timer) {
      _stockState.stockPrice();
    });
  return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  List<BottomNavigationBarItem> btmNavItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "미국주식"),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: "관심주식"),
  ];

  int _selectedIndex = 0;

  static List<Widget> _screens = <Widget>[
    StockScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    //디바이스의 사이즈를 size에 설정
    if(size == null) {
      size = MediaQuery.of(context).size;
    }
    return MultiProvider(
      providers: [
        //첫번 째 방법 (미리 실행해 줄것이 있다면 이 방법이 좋다)
        ChangeNotifierProvider<StockState>.value(value: widget._stockState),
        //두번 째 방법
        //ChangeNotifierProvider(create: (context) => StockState())
      ],
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: btmNavItems,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          onTap: _onBtmItemClick,
        ),
      ),
    );
  }

  void _onBtmItemClick(int index) {
    print(index);
    setState(() {
      _selectedIndex = index;
    });
  }
}

