import 'package:flutter/material.dart';
import 'expense.dart';

class ExpenseTrackerProvider extends ChangeNotifier {
  final List<Expense> _expenses = [];
  final int _budget = 5000;
  ExpenseCategory _selectedCategory = ExpenseCategory.food;

  List<Expense> get expenses => _expenses;
  ExpenseCategory get selectedCategory => _selectedCategory;

  int get totalAmount {
    int totalAmount = 0;
    for (Expense expense in _expenses) {
      totalAmount += expense.amount;
    }
    return totalAmount;
  }

  bool get isOverBudget {
    return totalAmount > _budget;
  }

  void addExpense(String title, int amount, ExpenseCategory category) {
    _expenses.add(Expense(id: DateTime.now().toString(), title: title, amount: amount, category: category));
    notifyListeners();
  }

  void setCategory(ExpenseCategory newCategory) {
    _selectedCategory = newCategory;
    notifyListeners();
  }

  void resetExpenses() {
    _expenses.clear();
    notifyListeners();
  }
}