import 'package:flutter/material.dart';

import 'user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel _state;

  UserModel get state => _state;

  bool get isLogin => _state != null;

  ///* 登录
  void login() {
    _state = UserModel.create(
      "Jonty",
      "86-8888-8888",
      "https://gank.io/images/d6bba8cf5b8c40f9ad229844475e9149",
      18,
    );
    notifyListeners();
  }

  ///* 退出
  void logout() {
    _state = null;
    notifyListeners();
  }
}
