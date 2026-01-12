class Event {
  final String title;
  final String location;

  Event({required this.title, required this.location});

  Event copyWith({String? title, String? location}) {
    return Event(
      title: title ?? this.title,
      location: location ?? this.location,
    );
  }
}