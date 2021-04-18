import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock/home_page.dart';
import 'package:stock/model/firebase_auth_state.dart';
import 'package:stock/screens/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  FirebaseAuthState _firebaseAuthState = FirebaseAuthState();

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider<FirebaseAuthState>.value(
    //   value: _firebaseAuthState,
    //   child: MaterialApp(
    //     home: Consumer<FirebaseAuthState>(
    //         builder: (BuildContext context,FirebaseAuthState firebaseAuthState, Widget child) {
    //           switch(firebaseAuthState.firebaseAuthStatus){
    //             case FirebaseAuthStatus.signout:
    //               return AuthScreen();
    //             case FirebaseAuthStatus.progress:
    //               return MyProgressIndicator();
    //             case FirebaseAuthStatus.signin:
    //               return HomePage();
    //             default:
    //               return MyProgressIndicator();
    //           }
    //         },
    //         child: HomePage()),
    //   ),
    // );
    return MaterialApp(
      home: AuthScreen(),
    );
  }
}
