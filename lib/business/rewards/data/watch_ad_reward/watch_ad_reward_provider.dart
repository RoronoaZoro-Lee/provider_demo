import 'package:flutter/material.dart';
import 'package:provider_demo/business/rewards/data/watch_ad_reward/watch_ad_reward_model.dart';

class WatchAdRewardProvider extends ChangeNotifier {
  List<WatchAdRewardModel> _state = [];

  List<WatchAdRewardModel> get state => _state;



}
