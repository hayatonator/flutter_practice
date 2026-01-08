import 'package:flutter/material.dart';
import 'package:flutter_practice/messenger/main_page.dart';
import 'package:provider/provider.dart';
// 自分で作ったファイルをインポートします
import 'counter/counter_provider.dart';
import 'counter/counter_page.dart';
import 'messenger/message_provider.dart';
import 'profile_manager/profile_manager_page.dart';
import 'profile_manager/profile_manager_provider.dart';
import 'temperature/temperature_page.dart';
import 'temperature/temperature_provider.dart';
import 'todo/todo_page.dart';
import 'todo/todo_provider.dart';

void main() {
  runApp(
    // 1. アプリ全体で CounterProvider を使えるように「注入」する
    ChangeNotifierProvider(
      create: (context) => MessageProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 2. 最初に表示する画面として CounterPage を指定する
      home: MainPage(),
    );
  }
}