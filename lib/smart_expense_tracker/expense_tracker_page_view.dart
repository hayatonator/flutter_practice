import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'expense.dart';
import 'expense_tracker_provider.dart';

class ExpenseTrackerPageView extends StatefulWidget {
  const ExpenseTrackerPageView({super.key});

  @override
  State<ExpenseTrackerPageView> createState() => _ExpenseTrackerPageViewState();
}

class _ExpenseTrackerPageViewState extends State<ExpenseTrackerPageView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  bool _isButtonEnabled = false;

  void _validate() {
    final title = _titleController.text;
    final amount = int.tryParse(_amountController.text) ?? 0;

    setState(() {
      _isButtonEnabled = title.isNotEmpty && amount > 0;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<ExpenseTrackerProvider>();
    
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _titleController,
            onChanged: (_) => _validate(),
            decoration: const InputDecoration(labelText: '項目名入力'),
          ),
          TextField(
            controller: _amountController,
            onChanged: (_) => _validate(),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(labelText: '金額を入力'),            
          ),
          DropdownButton<ExpenseCategory>(
            value: provider.selectedCategory,
            onChanged: (ExpenseCategory? newCategory) {
              provider.setCategory(newCategory!);
            },
            items: ExpenseCategory.values.map((category) {
              return DropdownMenuItem(
                value: category,
                child: Text(category.displayName),
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: _isButtonEnabled 
              ? () => provider.addExpense(_titleController.text, int.tryParse(_amountController.text) ?? 0, provider.selectedCategory)
              : null,
            child: Text('保存する'),
          ),
          Text('合計金額：${provider.totalAmount}'),
          Visibility(
            visible: provider.isOverBudget,
            child: Text('予算を超えています')),
          ElevatedButton(
            onPressed: () => provider.resetExpenses(),
            child: Text('リセット')
          ),
          Expanded(
            child: ListView.builder(
              itemCount: provider.expenses.length,
              itemBuilder: (context, index) {
                var expense = provider.expenses[index];
                return ListTile(
                  title: Text(expense.title),
                  trailing: Text('${expense.amount}円'),
                );
              }
            )
          )
        ]
      )
    );
  }
}