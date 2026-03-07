import 'package:flutter/material.dart';
import 'challenge_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChallengeMenuPage(),
    );
  }
}

class ChallengeMenuPage extends StatelessWidget {
  const ChallengeMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter練習')),
      body: ListView.builder(
        itemCount: challengeList.length,
        itemBuilder: (context, index) {
          final entry = challengeList[index];
          return ListTile(
            leading: Text(
              '${index + 1}',
              style: const TextStyle(color: Colors.grey),
            ),
            title: Text(entry.name),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => entry.build()),
            ),
          );
        },
      ),
    );
  }
}
