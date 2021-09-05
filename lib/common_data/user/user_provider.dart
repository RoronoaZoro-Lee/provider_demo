import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider_demo/utils/cache_util.dart';
import 'package:provider_demo/utils/log_util.dart';

import 'user_model.dart';

const _key_user = 'user';

class UserProvider extends ChangeNotifier {
  UserProvider({
    num fansNumber,
  }) {
    _fansNumber = fansNumber;
  }

  UserModel _state;

  int _fansNumber = 0;

  ///本地缓存
  UserModel get _localUserModel {
    try {
      return UserModel.fromJson(json.decode(CacheUtil().getString(_key_user)));
    } catch (e) {
      return null;
    }
  }

  UserModel get state => _state ?? _localUserModel;

  bool get isLogin => _state != null || _localUserModel != null;

  num get fansNumber => _fansNumber;

  ///* 登录
  void login() async {
    LogUtil.m("login");
    _state = UserModel.create(
      "Jonty",
      "86-8888-8888",
      "https://gank.io/images/d6bba8cf5b8c40f9ad229844475e9149",
      18,
    );
    CacheUtil().setString(_key_user, json.encode(_state.toJson()));
    await Future.delayed(Duration(seconds: 1));
    notifyListeners();
  }

  ///* 退出
  void logout() {
    _state = null;
    CacheUtil().remove(_key_user);
    notifyListeners();
  }

  void setUserInfo(UserModel user) {
    _state = user;
    CacheUtil().setString(_key_user, json.encode(_state.toJson()));
    LogUtil.m("set user info : ${_state.toJson()}");
    notifyListeners();
  }

  @override
  void dispose() {
    LogUtil.m("user provider dispose");
    super.dispose();
  }
}
