import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'event_edit_page_view.dart';
import 'event_provider.dart';

class EventPageView extends StatelessWidget {
  const EventPageView({super.key});

  @override
Widget build(BuildContext context) {
  var provider = context.watch<EventProvider>();
  var state = provider.state; // 短く書けるように変数化

  return Scaffold(
    appBar: AppBar(title: const Text('イベント詳細')), // 画面の境界を明確にする
    body: Padding(
      padding: const EdgeInsets.all(16.0), // 全体にゆとりを持たせる
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 左揃えに統一
        children: [
          // 1. メイン情報のカード（情報の塊を作る）
          Card(
            child: ListTile(
              title: Text(
                state.event.title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('場所：${state.event.location}'),
              trailing: Icon(
                state.isComplete ? Icons.check_circle : Icons.pending,
                color: state.isComplete ? Colors.green : Colors.orange,
              ),
            ),
          ),
          
          const SizedBox(height: 16), // 要素間のスキマ

          // 2. ステータスと更新日時（補足情報）
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('最終更新：${_formatDate(state.lastUpdated)}'),
                const SizedBox(height: 8),
                Text(
                  state.isComplete ? '【完了済み】' : '【未完了のタスクがあります】',
                  style: TextStyle(color: state.isComplete ? Colors.green : Colors.red),
                ),
              ],
            ),
          ),

          const Spacer(), // 下のボタンを一番下に押し下げる

          // 3. アクションボタン（主役のボタンを大きく）
          SizedBox(
            width: double.infinity, // 横幅いっぱい
            child: ElevatedButton.icon(
              onPressed: () => provider.updateEvent(isComplete: !state.isComplete),
              icon: Icon(state.isComplete ? Icons.undo : Icons.done),
              label: Text(state.isComplete ? '未完了に戻す' : '完了にする'),
            ),
          ),
          
          const SizedBox(height: 8),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const EventEditPageView())
              ),
              icon: const Icon(Icons.edit),
              label: const Text('内容を編集する'),
            ),
          ),
        ],
      ),
    ),
  );
}

  // 日時を見やすく整形する補助メソッド（UIの配慮）
  String _formatDate(DateTime date) {
    return '${date.year}/${date.month}/${date.day} ${date.hour}:${date.minute}';
  }
}