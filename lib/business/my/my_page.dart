import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/business/my/data/reward/reward_provider.dart';
import 'package:provider_demo/common_data/user/user_provider.dart';
import 'package:provider_demo/utils/log_util.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    Future.microtask(() {
      context.read<RewardProvider>().setReward(100, 20, 23);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
    return GestureDetector(
      onTap: () => _openFansPage(),
      child: Card(
        margin: EdgeInsets.all(12),
        child: Container(
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              ClipOval(
                child: Image.network(
                  Provider.of<UserProvider>(context).state?.avatar ?? "",
                  // context.watch<UserProvider>().state?.avatar ?? '',
                  // context.select((UserProvider value) => value.state?.avatar),
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // "姓名 ：${context.watch<UserProvider>().state?.userName}",
                      "姓名 ：${context.select((UserProvider value) => value.state?.userName)}",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      // "年龄 ： ${context.watch<UserProvider>().state?.age?.toString()}",
                      "年龄 ： ${context.select((UserProvider value) => value.state?.age?.toString())}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "粉丝 ： ${context.select((UserProvider value) => value.fansNumber)}",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
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
            Selector<RewardProvider, RewardProvider>(
              shouldRebuild: (previous, next) {
                return next.state.fansReward >= 25;
              },
              selector: (context, provider) => provider,
              builder: (context, provider, child) {
                LogUtil.m("my page build watchAdReward");
                return _buildRewardItem(
                  "广告奖励",
                  // provider.state?.watchAdReward?.toString(),
                  context.select((RewardProvider value) =>
                      value.state?.watchAdReward?.toString()),
                );
              },
            ),
            _buildRewardItem(
              "创作奖励",
              // provider.state?.creationReward?.toString(),
              //

              // context.watch<RewardProvider>().state?.creationReward?.toString(),

              context.select((RewardProvider value) =>
                  value.state?.creationReward?.toString()),
            ),
            Consumer<RewardProvider>(
              builder: (context, provider, child) {
                LogUtil.m("my page build fansReward");
                return _buildRewardItem(
                  "粉丝奖励",
                  provider.state?.fansReward?.toString(),

                  // context.select((RewardProvider value) =>
                  // value.state?.fansReward?.toString()),
                );
              },
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

  int count = 1;

  void _openFansPage() {
    count++;
    context.read<RewardProvider>().justNotify();
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return FansPage();
    // }));
  }
}
