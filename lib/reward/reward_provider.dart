import 'package:flutter/material.dart';

import 'reward_model.dart';

class RewardProvider extends ChangeNotifier {
  RewardModel _state;

  RewardModel get state => _state;

  void initReward() {
    _state = RewardModel.create(100, 2034, 2234);
    notifyListeners();
  }
}
