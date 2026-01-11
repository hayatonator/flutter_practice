import 'package:flutter/material.dart';
import 'seat.dart';

class SeatBookingProvider extends ChangeNotifier {
  final List<Seat> _seatList = [Seat(id: '1'), Seat(id: '2'), Seat(id: '3'), Seat(id: '4'), Seat(id: '5'), Seat(id: '6'),Seat(id: '7'), Seat(id: '8'), Seat(id: '9'),Seat(id: '10')];

  List<Seat> get seatList => _seatList;
  int get selectedCount => _seatList.where((seat) => seat.isSelected).length;
  int get totalPrice => selectedCount * 1000;

  void toggleSeatSelection(Seat seat) {
    seat.isSelected = !seat.isSelected;
    notifyListeners();
  }

  void bookSeats () {
    for (Seat seat in _seatList) {
      if(seat.isSelected) {
        seat.isReserved = true;
        seat.isSelected = false;
      }
    }
    notifyListeners();
  }
}