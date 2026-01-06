import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'profile_manager_provider.dart';

class ProfileManagerPage extends StatefulWidget {
  const ProfileManagerPage({super.key});

  @override
  State<ProfileManagerPage> createState() => _ProfileManagerPageState();
}

class _ProfileManagerPageState extends State<ProfileManagerPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<ProfileManagerProvider>();
    
    return Scaffold(body: 
      Column(
        children: [
          Text('名前：${provider.user.name}'),
          Text('年齢：${provider.user.age.toString()}'),
          Row(
            children:[
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(labelText: '名前を入力'),
                ),
              ),
              ElevatedButton(
                onPressed: () => provider.updateName(_controller.text),
                child: Text('変更')
              ),
            ]
          ),
          Row(
            children: [
              Text('年齢設定'),
              ElevatedButton(
                onPressed: () => provider.updateAge(provider.user.age - 1), 
                child: Text('-')
              ),
              ElevatedButton(
                onPressed: () => provider.updateAge(provider.user.age + 1), 
                child: Text('+')
              ),
            ],)
        ],
      )
    );
  }
}