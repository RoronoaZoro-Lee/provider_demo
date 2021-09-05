import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/business/navigator/data/bottom_index/bottom_index_provider.dart';
import 'package:provider_demo/common_data/fans/fans_provider.dart';
import 'package:provider_demo/business/navigator/navigator_page.dart';
import 'package:provider_demo/business/my/data/reward/reward_provider.dart';
import 'package:provider_demo/common_data/user/user_provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => FansProvider(),
        ),
        ProxyProvider<FansProvider, UserProvider>(
            update: (_, fansProvider, __) {
          return UserProvider(fansNumber: fansProvider.fansNumber);
        }),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
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
          ChangeNotifierProvider(create: (_) => RewardProvider()),
          ChangeNotifierProvider(create: (_) => BottomIndexProvider()),
        ],
        child: NavigatorPage(title: 'Provider Demo'),
      ),
    );
  }
}
