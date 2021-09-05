import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/bottom_index/bottom_index_provider.dart';
import 'package:provider_demo/navigator_page.dart';
import 'package:provider_demo/reward/reward_provider.dart';
import 'package:provider_demo/user/user_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => UserProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  RewardProvider _rewardProvider = RewardProvider();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: _rewardProvider),
          ChangeNotifierProvider(create: (_) => BottomIndexProvider()),
        ],
        child: NavigatorPage(title: 'Provider Demo'),
      ),
    );
  }
}
