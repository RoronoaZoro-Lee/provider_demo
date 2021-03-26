import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Data with ChangeNotifier {
  int count = 0;

  void add() {
    count++;
  }
}

class ProviderDemo extends StatefulWidget {
  @override
  _ProviderDemoState createState() => _ProviderDemoState();
}

class _ProviderDemoState extends State<ProviderDemo> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Data(),
      builder: (context, child) => Scaffold(
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
