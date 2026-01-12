import 'package:flutter/material.dart';
import 'event.dart';
import 'event_state.dart';

class EventProvider extends ChangeNotifier {
  EventState _state = EventState.initial();

  EventState get state => _state;

  void updateEvent({String? newTitle, String? newLocation, bool? isComplete}) {
    _state = _state.copyWith(
      event: _state.event.copyWith(
        title: newTitle ?? _state.event.title,
        location: newLocation ?? _state.event.location,
      ),
      isComplete: isComplete ?? _state.isComplete,
    );
    notifyListeners();
  }
}