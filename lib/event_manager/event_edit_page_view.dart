import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'event_provider.dart';

class EventEditPageView extends StatefulWidget {
  const EventEditPageView({super.key});

  @override
  State<EventEditPageView> createState() => _EventEditPageViewState();
}

class _EventEditPageViewState extends State<EventEditPageView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  dispose() {
    _titleController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  initState() {
    super.initState();
    final initialState = context.read<EventProvider>().state;
    _titleController.text = initialState.event.title;
    _locationController.text = initialState.event.location;
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<EventProvider>();

    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('戻る'),
          ),
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'イベントタイトルを記入'),
          ),
          ElevatedButton(
            onPressed: () => provider.updateEvent(newTitle: _titleController.text),
            child: Text('変更'),
          ),
          TextField(
            controller: _locationController,
            decoration: const InputDecoration(labelText: '場所を記入'),
          ),
          ElevatedButton(
            onPressed: () => provider.updateEvent(newLocation: _locationController.text),
            child: Text('変更'),
          )
        ]
      )
    );
  }
}