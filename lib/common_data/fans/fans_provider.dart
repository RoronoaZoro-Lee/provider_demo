import 'package:flutter/material.dart';
import 'package:provider_demo/utils/log_util.dart';

import 'fans_model.dart';

class FansProvider extends ChangeNotifier {
  FansProvider() {
    LogUtil.m("fans provider init");
    getFans();
  }

  final state = FansModel();

  List<FansModel> _fansList = [];

  num get fansNumber => _fansList.length;

  void getFans() async {
    _fansList.add(FansModel());
    notifyListeners();
  }

  @override
  void dispose() {
    LogUtil.m("fans provider dispose");
    super.dispose();
  }
}
