import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'seat_booking_provider.dart';

class SeatBookingPageView extends StatelessWidget {
  const SeatBookingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<SeatBookingProvider>();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.seatList.length,
              itemBuilder: (context, index) {
                final seat = provider.seatList[index];

                return ListTile(
                  title: Text('席 #${seat.id}',
                    style: TextStyle(
                      decoration: seat.isReserved
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    )
                  ),
                  leading: Checkbox(
                    value: seat.isSelected,
                    onChanged: seat.isReserved ? null : (_) => provider.toggleSeatSelection(seat)),
                  );
              }
            ),

          ),
          Text('${provider.selectedCount}席選択中、合計${provider.totalPrice}円'),
          ElevatedButton(
            onPressed: () => provider.bookSeats(),
            child: Text('予約する'),
          )
        ],
      )
    );
  }
}