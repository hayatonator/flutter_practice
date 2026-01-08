import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'book.dart';
import 'library_provider.dart';

class LibraryListPage extends StatefulWidget {
  const LibraryListPage({super.key});

  @override
  State<LibraryListPage> createState() => _LibraryListPageState();
}

class _LibraryListPageState extends State<LibraryListPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  
  @override
  dispose() {
    _titleController.dispose();
    _authorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<LibraryProvider>();
    
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: '本の名前を入力'),
          ),
          TextField(
            controller: _authorController,
            decoration: const InputDecoration(labelText: '著者を入力')
          ),
          ElevatedButton(
            onPressed: () => provider.addBook(_titleController.text,_authorController.text),
            child: Text('本を追加'),
          ),
          Row(
            children:[
              Expanded(
                child:Text(
                  switch (provider.filterStatus) {
                    'all' => '全て',
                    'available' => '保管中',
                    'unavailable' => '貸出中',
                    _ => '',
                  }
                ),
              ),
              ElevatedButton(
                onPressed: () => provider.changeFilter(),
                child: Text('フィルター変更'),
              ),
            ],
          ), 
          Expanded(
            child: ListView.builder(
              itemCount: provider.displayBooks.length,
              itemBuilder: (context, index) {
                final book = provider.displayBooks[index];
                return ListTile(
                  title: Row(
                    children: [
                      Expanded(child: 
                        Text(book.title)
                      ),
                      Text('著者：${book.author}')
                    ]
                  ),
                  leading: OutlinedButton(
                    onPressed: () => provider.updateBookAvailability(book),
                    child: Text(
                      book.isLent ? '返却する' : '借りる'
                    )
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BookEditPage(book: book)));
                        },
                        child: Text('詳細'),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => provider.removeBook(book),
                      ),
                    ]
                  ),
                );
              }
            )
          )
        ]
      )
    );
  }
}

class BookEditPage extends StatefulWidget {
  const BookEditPage({super.key, required this.book});
  final Book book;

  @override
  State<BookEditPage> createState() => _BookEditPageState();
}

class _BookEditPageState extends State<BookEditPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.book.title;
    _authorController.text = widget.book.author;
  }

  @override
  dispose() {
    _titleController.dispose();
    _authorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<LibraryProvider>();

    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('戻る')
          ),
          Text('タイトル：${widget.book.title}. 著者：${widget.book.author}'),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'タイトルを編集'),
                )
              ),
              ElevatedButton(
                onPressed: () => provider.editBookTitle(widget.book, _titleController.text),
                child: Text('変更')
              )
            ]
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _authorController,
                  decoration: const InputDecoration(labelText: '著者を編集'),
                )
              ),
              ElevatedButton(
                onPressed: () => provider.editBookAuthor(widget.book, _authorController.text),
                child: Text('変更')
              )
            ]
          )
        ]
      )
    );
  }
}