import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'album_detail_page.dart';
import 'album_manager_provider.dart';

class AlbumManagerPage extends StatefulWidget {
  const AlbumManagerPage({super.key});

  @override
  State<AlbumManagerPage> createState() => _AlbumManagerPageState();
}

class _AlbumManagerPageState extends State<AlbumManagerPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<AlbumManagerProvider>();

    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(labelText: 'アルバム名入力'),
          ),
          ElevatedButton(
            onPressed: () => provider.addAlbum(_controller.text),
            child: Text('登録'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: provider.albumList.length,
              itemBuilder: (context, index) {
                final album = provider.albumList[index];
                return ListTile(
                  title: Text(album.name),
                  leading: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => provider.deleteAlbumWithIndex(index),
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AlbumDetailPage(albumName: album.name)));
                    },
                    child: Text('詳細'))
                );
              },
            )
          )
        ],
      )
    );
  }
}