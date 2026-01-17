class Expense {
  final String id;
  final String title;
  final int amount;
  final ExpenseCategory category;

  Expense({required this.id, required this.title, required this.amount, required this.category});

  Expense copyWith({String? id, String? title, int? amount, ExpenseCategory? category}) {
    return Expense(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      category: category ?? this.category
    );
  }
}

enum ExpenseCategory {
  food,
  transport,
  others,
}

extension ExpenseCategoryExtension on ExpenseCategory {
  String get displayName {
    switch (this) {
      case ExpenseCategory.food:
        return '食費';
      case ExpenseCategory.transport:
        return '交通費';
      case ExpenseCategory.others:
        return 'その他';
    }
  }
}