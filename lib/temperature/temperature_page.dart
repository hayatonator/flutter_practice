import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'temperature_provider.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({super.key});

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<TemperatureProvider>();
    
    return Scaffold (
      body: Column(
        children: [
          Text('現在の摂氏：${provider.celsius}  現在の華氏：${provider.fahrenheit}'),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(labelText: '温度（摂氏）を入力してください'),
            onChanged: (value) => provider.updateCelsius(double.tryParse(value) ?? 0),
          )
        ]
      )
    );
  }
}