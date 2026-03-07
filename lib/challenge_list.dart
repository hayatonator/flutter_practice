import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter/counter_page.dart';
import 'counter/counter_provider.dart';
import 'memo_manager/memo_model.dart';
import 'memo_manager/memo_page.dart';
import 'temperature/temperature_page.dart';
import 'temperature/temperature_provider.dart';
import 'todo/todo_page.dart';
import 'todo/todo_provider.dart';
import 'profile_manager/profile_manager_page.dart';
import 'profile_manager/profile_manager_provider.dart';
import 'messenger/main_page.dart';
import 'messenger/message_provider.dart';
import 'album_manager/album_manager_page.dart';
import 'album_manager/album_manager_provider.dart';
import 'library/library_view.dart' show LibraryListPage;
import 'library/library_provider.dart';
import 'seat_booking/seat_booking_page_view.dart';
import 'seat_booking/seat_booking_provider.dart';
import 'cart/cart_page_view.dart';
import 'cart/cart_provider.dart';
import 'event_manager/event_page_view.dart';
import 'event_manager/event_provider.dart';
import 'smart_expense_tracker/expense_tracker_page_view.dart';
import 'smart_expense_tracker/expense_tracker_provider.dart';

class ChallengeEntry {
  final String name;
  final Widget Function() build;
  const ChallengeEntry({required this.name, required this.build});
}

// 新しい課題を追加するときはこのリストに1エントリ追加するだけでOK
final List<ChallengeEntry> challengeList = [
  ChallengeEntry(
    name: 'Counter',
    build: () => ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: const CounterPage(),
    ),
  ),
  ChallengeEntry(
    name: '温度変換',
    build: () => ChangeNotifierProvider(
      create: (_) => TemperatureProvider(),
      child: const TemperaturePage(),
    ),
  ),
  ChallengeEntry(
    name: 'Todoリスト',
    build: () => ChangeNotifierProvider(
      create: (_) => TodoProvider(),
      child: const TodoPage(),
    ),
  ),
  ChallengeEntry(
    name: 'プロフィールマネージャー',
    build: () => ChangeNotifierProvider(
      create: (_) => ProfileManagerProvider(),
      child: const ProfileManagerPage(),
    ),
  ),
  ChallengeEntry(
    name: 'メッセンジャー',
    build: () => ChangeNotifierProvider(
      create: (_) => MessageProvider(),
      child: const MainPage(),
    ),
  ),
  ChallengeEntry(
    name: 'アルバムマネージャー',
    build: () => ChangeNotifierProvider(
      create: (_) => AlbumManagerProvider(),
      child: const AlbumManagerPage(),
    ),
  ),
  ChallengeEntry(
    name: '図書館管理',
    build: () => ChangeNotifierProvider(
      create: (_) => LibraryProvider(),
      child: const LibraryListPage(),
    ),
  ),
  ChallengeEntry(
    name: '座席予約',
    build: () => ChangeNotifierProvider(
      create: (_) => SeatBookingProvider(),
      child: const SeatBookingPageView(),
    ),
  ),
  ChallengeEntry(
    name: 'カート',
    build: () => ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: const CartPageView(),
    ),
  ),
  ChallengeEntry(
    name: 'イベントマネージャー',
    build: () => ChangeNotifierProvider(
      create: (_) => EventProvider(),
      child: const EventPageView(),
    ),
  ),
  ChallengeEntry(
    name: 'スマート支出トラッカー',
    build: () => ChangeNotifierProvider(
      create: (_) => ExpenseTrackerProvider(),
      child: const ExpenseTrackerPageView(),
    ),
  ),
  ChallengeEntry(
    name: 'メモ帳アプリ（UX強化版）',
    build: () => ChangeNotifierProvider(
      create: (_) => MemoNotifier(),
      child: const MemoPageView(),
    ),
  ),
  // ---- 新しい課題はここに追加 ----
  // ChallengeEntry(
  //   name: '課題名',
  //   build: () => ChangeNotifierProvider(
  //     create: (_) => XxxProvider(),
  //     child: const XxxPage(),
  //   ),
  // ),
];
