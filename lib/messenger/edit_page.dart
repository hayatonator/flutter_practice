import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'message_provider.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<MessageProvider>();

    return Scaffold(body:
      Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(labelText: 'メッセージを入力'),
          ),
          ElevatedButton(
            child: Text('保存する'),
            onPressed: (){
              provider.editMessage(_controller.text);
              Navigator.pop(context);
            })
      ],));
  }
}