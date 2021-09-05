import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/business/rewards/data/fans_reward/fans_reward_model.dart';
import 'package:provider_demo/utils/log_util.dart';


class FansRewardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<FansRewardModel>>(
      create: (_) => _getFansRewardModelList(),
      initialData: [],
      child: Scaffold(
        appBar: AppBar(title: Text("观看广告奖励")),
        body: _buildList(),
      ),
    );
  }

  Widget _buildList() {
    LogUtil.m("fans reward page build List");
    return Consumer<List<FansRewardModel>>(builder: (context, list, child) {
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

  Stream<List<FansRewardModel>> _getFansRewardModelList() {
    return Stream<List<FansRewardModel>>.periodic(Duration(seconds: 1),
            (x) => ["1", "2", "3", "4"].map((e) => FansRewardModel()).toList())
        .take(10);
  }
}
