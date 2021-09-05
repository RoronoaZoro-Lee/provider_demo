import 'package:flutter/material.dart';
import 'package:provider_demo/utils/log_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    LogUtil.m("home page build");
    super.build(context);
    return Center(
      child: Text("home"),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
