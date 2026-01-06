import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}



class _CounterPageState extends State<CounterPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<CounterProvider>();

    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                child: const Text('増やす'),
                onPressed: ()=> provider.addCount()),
              Expanded(
                child:
                  TextField(
                    controller: _controller,
                    decoration: const InputDecoration(labelText: '最大値を入力'),
                  ),
                ),
              ElevatedButton(
                child: const Text('更新'),
                onPressed: () => provider.updateMaxCountFromTextField(int.tryParse(_controller.text) ?? 0),
              )
            ],
          ),          
          Text(provider.count.toString()),
          Text('最大値: ${provider.maxCount.toString()}'),
        ],
      )
    );
  }
}