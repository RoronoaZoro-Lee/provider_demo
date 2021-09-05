import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/business/rewards/data/watch_ad_reward/watch_ad_reward_model.dart';
import 'package:provider_demo/utils/log_util.dart';

class WatchAdRewardPage extends StatefulWidget {
  const WatchAdRewardPage({Key key}) : super(key: key);

  @override
  _WatchAdRewardPageState createState() => _WatchAdRewardPageState();
}

class _WatchAdRewardPageState extends State<WatchAdRewardPage> {
  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<WatchAdRewardModel>>(
      create: (_) => _getWatchAdRewardModelList(),
      initialData: [],
      child: Scaffold(
        appBar: AppBar(title: Text("观看广告奖励")),
        body: _buildList(),
      ),
    );
  }

  Widget _buildList() {
    LogUtil.m("ad reward page build List");
    return Consumer<List<WatchAdRewardModel>>(builder: (context, list, child) {
      return ListView.builder(
        itemBuilder: (ct, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(10),
              height: 100,
              color: Colors.red,
            ),
          );
        },
        itemCount: list.length,
      );
    });
  }

  Future<List<WatchAdRewardModel>> _getWatchAdRewardModelList() async {
    await Future.delayed(Duration(seconds: 3));
    return ["1", "2", "3", "4"]
        .map((e) => WatchAdRewardModel(
              createTime: "2021-12-1$e，12：0$e",
              watchTime: "1$e 秒",
              rewardAmount: "3$e 元",
            ))
        .toList();
  }
}
