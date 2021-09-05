import 'package:flutter/material.dart';

import 'reward_state.dart';

class RewardProvider extends ChangeNotifier {
  RewardState _state;

  RewardState get state => _state;

  void initReward() {
    _state = RewardState.create(100, 2034, 2234);
    notifyListeners();
  }
}
