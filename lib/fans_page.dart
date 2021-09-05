import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/fans/fans_provider.dart';
import 'package:provider_demo/user/user_model.dart';
import 'package:provider_demo/user/user_provider.dart';
import 'package:provider_demo/utils/log_util.dart';

class FansPage extends StatefulWidget {
  const FansPage({Key key}) : super(key: key);

  @override
  _FansPageState createState() => _FansPageState();
}

class _FansPageState extends State<FansPage> {
  @override
  void initState() {
    // Future.microtask(() {
    //   context.read<FansProvider>().getFans();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("粉丝")), body: _buildList());
  }

  _buildList() {
    LogUtil.m("fans page build List");
    return ListView.builder(
      itemBuilder: (ct, index) {
        return GestureDetector(
          onTap: () {
            print(";;;");
            // context.read<FansProvider>().getFans();
            // context.read<UserProvider>().logout();
            context.read<UserProvider>().setUserInfo(
                  UserModel.create(
                    "Jonty $index",
                    "86-8888-8888",
                    // "https://gank.io/images/d6bba8cf5b8c40f9ad229844475e9149",
                    "https://gank.io/images/9fa43020cf724c69842eec3e13f6d21c",
                    18 + index,
                  ),
                );
          },
          child: Container(
            margin: EdgeInsets.all(10),
            height: 100,
            color: Colors.red,
          ),
        );
      },
      itemCount: context.watch<FansProvider>().fansNumber,
    );
  }
}
