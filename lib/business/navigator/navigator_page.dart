import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/business/navigator/data/bottom_index/bottom_index_provider.dart';
import 'package:provider_demo/business/home/home_page.dart';
import 'package:provider_demo/business/my/my_page.dart';
import 'package:provider_demo/common_data/user/user_provider.dart';
import 'package:provider_demo/utils/cache_util.dart';
import 'package:provider_demo/utils/log_util.dart';

// const _homeIndex = 0;
const _myIndex = 1;

class NavigatorPage extends StatefulWidget {
  NavigatorPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  final PageController _controller = PageController(initialPage: 0);

  @override
  void initState() {
    CacheUtil().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LogUtil.m("navigator page build");

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(
        //禁止PageView滑动
        physics: NeverScrollableScrollPhysics(),
        //PageView控制器
        controller: _controller,
        children: <Widget>[
          //要显示的页面
          HomePage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: Consumer<BottomIndexProvider>(
        builder: (context, provider, child) {
          return BottomNavigationBar(
            currentIndex: provider.index,
            onTap: (index) => _clickBottomItem(index),
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                label: "My",
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  void _clickBottomItem(int index) async {
    if (index == _myIndex && !context.read<UserProvider>().isLogin) {
      showDialog(
          context: context,
          builder: (_) {
            return Center(
              child: Container(
                color: Colors.white,
                child: TextButton(
                    onPressed: () {
                      context.read<UserProvider>().login();
                      Navigator.pop(context);
                      _controller.jumpToPage(index);
                      context.read<BottomIndexProvider>().setIndex(index);
                    },
                    child: Text("登录")),
              ),
            );
          });
    } else {
      _controller.jumpToPage(index);
      context.read<BottomIndexProvider>().setIndex(index);
    }
  }
}
