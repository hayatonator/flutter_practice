import 'package:flutter/material.dart';

class AlbumDetailPage extends StatelessWidget {
  final String albumName;

  const AlbumDetailPage({super.key, required this.albumName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('戻る'),
          ),
          Expanded(
            child: Center(
              child: Text(albumName)
              )
          ),
        ]
      )
    );
  }
}