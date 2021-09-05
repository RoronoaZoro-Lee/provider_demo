import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/reward/reward_provider.dart';
import 'package:provider_demo/user/user_provider.dart';
import 'package:provider_demo/utils/log_util.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    WidgetsBinding.instance.endOfFrame.then((value) => {
          LogUtil.m("end of frame"),
          context.read<RewardProvider>().initReward(),
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LogUtil.m("my page build");
    return Column(
      children: [
        _buildUser(),
        _buildReward(),
      ],
    );
  }

  Widget _buildUser() {
    LogUtil.m("my page build User");
    LogUtil.m("${Provider.of<UserProvider>(context).state.toString()}");
    return Card(
      margin: EdgeInsets.all(12),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            ClipOval(
              child: Image.network(
                Provider.of<UserProvider>(context).state.avatar,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "姓名 ： ${Provider.of<UserProvider>(context).state.userName}",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "年龄 ： ${Provider.of<UserProvider>(context).state.age?.toString()}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReward() {
    LogUtil.m("my page build Reward");
    return Card(
      margin: EdgeInsets.all(12),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            _buildRewardItem(
              "广告奖励",
              context.watch<RewardProvider>().state?.watchAdReward?.toString(),
            ),
            _buildRewardItem(
              "创作奖励",
              context.watch<RewardProvider>().state?.creationReward?.toString(),
            ),
            _buildRewardItem(
              "粉丝奖励",
              context.watch<RewardProvider>().state?.fansReward?.toString(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRewardItem(String title, String content) {
    return Expanded(
        child: Column(
      children: [
        Text(
          title ?? '',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
        Text(
          content ?? '',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
