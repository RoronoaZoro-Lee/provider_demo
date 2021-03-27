import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Data with ChangeNotifier {
  int count = 0;
  String name = "kangkang";

  void add() {
    print("接受并发布");
    count++;
    notifyListeners();
  }

  void editName(String name) {
    this.name = name;
    notifyListeners();
  }
}

class ProviderDemo extends StatefulWidget {
  @override
  _ProviderDemoState createState() => _ProviderDemoState();
}

class _ProviderDemoState extends State<ProviderDemo> {
  @override
  Widget build(BuildContext context) {
    print("================ProviderDemo build=================");
    return Scaffold(
      body: Column(
        children: [
          StlA(),
          GestureDetector(
            onTap: () {
              print("点击");
              context.read<Data>().add();
              // context.read<Data>().editName("name");
            },
            child: Container(
              width: double.maxFinite,
              height: 100,
              color: Colors.orange,
              alignment: Alignment.center,
              child: Text("点击"),
            ),
          )
        ],
      ),
    );
  }
}

class StlA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("StlA build");
    return Column(
      children: [
        // Consumer(
        //   builder: (BuildContext context, Data value, Widget child) {
        //     print("================Consumer build=================");
        //     return Container(
        //       width: double.maxFinite,
        //       height: 100,
        //       color: Colors.red,
        //       alignment: Alignment.center,
        //       child: Text("Consumer ${value.count}"),
        //     );
        //   },
        // ),
        // Selector(
        //     builder: (
        //       context,
        //       String name,
        //       Widget child,
        //     ) {
        //       print("================Selector build=================");
        //       return Container(
        //         width: double.maxFinite,
        //         height: 100,
        //         color: Colors.yellow,
        //         alignment: Alignment.center,
        //         child: Text("Selector $name"),
        //       );
        //     },
        //     selector: (context, Data data) => data.name),
        Container(
          width: double.maxFinite,
          height: 100,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text("没关系的"),
        ),
        Container(
          width: double.maxFinite,
          height: 100,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text("${Provider.of<Data>(context).count}"),
        ),
      ],
    );
  }
}
