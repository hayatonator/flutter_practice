import 'event.dart';

final class EventState {
  final Event event;
  final DateTime lastUpdated;
  final bool isComplete;

  EventState({required this.event, required this.lastUpdated, this.isComplete = false});

  static EventState initial() {
    return EventState(
      event: Event(title: '未設定', location: '未設定'),
      lastUpdated: DateTime.now(),
    );
  }
  
  EventState copyWith({Event? event, bool? isComplete}) {
    return EventState(
      event: event ?? this.event,
      lastUpdated: DateTime.now(),
      isComplete: isComplete ?? this.isComplete,
    );
  }
}