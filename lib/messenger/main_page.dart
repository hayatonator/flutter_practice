import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'message_provider.dart';
import 'edit_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<MessageProvider>();

    return Scaffold(body:
      Column(
        children: [
          Text('ただいまのメッセージ：${provider.message}'),
          ElevatedButton(
            onPressed: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const EditPage()))
            },
            child: Text('編集する'),
          )
        ],
      )
    );
  }
}