import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'memo_model.dart';

class MemoPageView extends StatelessWidget {
  const MemoPageView({super.key});

  @override
  build(BuildContext context) {
    var provider = context.watch<MemoNotifier>();

    return Scaffold(
      body: Column (
        children: [
          Text('メモ管理アプリ'),
          provider.isMemoListEmpty ? 
            Text('メモがありません') :
            Expanded(
              child: ListView.builder(
                itemCount: provider.memoList.length,
                itemBuilder: (context, index) {
                  final memo = provider.memoList[index];
                  return Dismissible(
                    key: Key(memo.id),
                    confirmDismiss: (direction) async {
                      final result = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('削除しますか？'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: Text('キャンセル'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: Text('削除'),
                            ),
                          ]
                        )
                      );
                      return result;
                    },
                    onDismissed: (direction) {
                      provider.removeMemo(memo);
                    },
                    child: ListTile(
                      title: Text(memo.title),
                      subtitle: Text(memo.memoText)
                    ),
                  );
                }
              )
            )
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final notifier = context.read<MemoNotifier>();
          showModalBottomSheet(
            context: context,
            builder: (context) => _AddMemoModalPageView(
              notifier: notifier,
            ));
        }
      ),
    );
  }
}

class _AddMemoModalPageView extends StatefulWidget {
  final MemoNotifier notifier;
  const _AddMemoModalPageView({required this.notifier});

  @override
  State<_AddMemoModalPageView> createState() => _AddMemoModalPageViewState();
}

class _AddMemoModalPageViewState extends State<_AddMemoModalPageView> {
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _memoTextEditingController = TextEditingController();
  String? _errorMessage;

  @override
  dispose() {
    super.dispose();
    _titleEditingController.dispose();
    _memoTextEditingController.dispose();
  }

  @override
  initState() {
    super.initState();
    _titleEditingController.text = '';
    _memoTextEditingController.text = '';
    _errorMessage = null;
  }

  @override
  build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _titleEditingController,
            decoration: InputDecoration(labelText: 'タイトルを記入', errorText: _errorMessage),
          ),
          TextField(
            controller: _memoTextEditingController,
            decoration: const InputDecoration(labelText: '本文を記入'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_titleEditingController.text == '') {
                setState(() {_errorMessage = 'タイトルを入力してください';});
              } else {
                widget.notifier.addMemo(_titleEditingController.text, _memoTextEditingController.text);
                Navigator.pop(context);
              }
            },
            child: Text('追加')
          )
        ]
      )
    );
  }
}