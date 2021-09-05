import 'package:flutter/material.dart';

import 'reward_model.dart';

class RewardProvider extends ChangeNotifier {
  RewardModel _state;

  RewardModel get state => _state;

  void setReward(
    num watchAdReward,
    num creationReward,
    num fansReward,
  ) {
    _state = RewardModel.create(watchAdReward, creationReward, fansReward);
    notifyListeners();
  }

  void justNotify() {
    notifyListeners();
  }
}
