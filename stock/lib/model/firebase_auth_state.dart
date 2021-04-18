import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthState extends ChangeNotifier {
  // 첫 상태는 progress로 시작한다.
  FirebaseAuthStatus _firebaseAuthStatus = FirebaseAuthStatus.progress;

  // firebase_auth에서 가지고 온다
  FirebaseUser _firebaseUser;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void watchAuthChange() {
    //onAuthStateChanged는 firebaseUser가 변화가 될 때 마다 Stream으로 계속 던져준다.
    _firebaseAuth.onAuthStateChanged.listen((firebaseUser) {
      if (firebaseUser == null && _firebaseUser == null) {
        return;
      } else if (firebaseUser != _firebaseUser) {
        //_firebaseUser 와 firebaseUser 가 같지 않기 때문에 업데이트를 해 준다
        _firebaseUser = firebaseUser;

        //() 인수에 아무것도 넣어주지 않았기 때문에 firebaseAuthStatus는 null로 작동한다
        //메서드를실행하면 firebaseUser가 있는지 없는지 판단해서 signin또는 signout을 설정한다
        changeFirebaseAuthStatus();
      }
    });
  }

  //[ ]로 감싸면 생략 가능
  void changeFirebaseAuthStatus([FirebaseAuthStatus firebaseAuthStatus]) {
    if (firebaseAuthStatus != null) {
      _firebaseAuthStatus = firebaseAuthStatus;
    } else {
      if (_firebaseUser != null) {
        _firebaseAuthStatus = FirebaseAuthStatus.signin;
      } else {
        _firebaseAuthStatus = FirebaseAuthStatus.signout;
      }
    }
    notifyListeners();
  }

  FirebaseAuthStatus get firebaseAuthStatus => _firebaseAuthStatus;

}

enum FirebaseAuthStatus { signout, progress, signin }
