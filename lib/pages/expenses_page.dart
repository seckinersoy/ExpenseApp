import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage(this.expenses, this.onRemove, this.onUndo, {Key? key})
      : super(key: key);
  final List<Expense> expenses;
  final void Function(Expense expense) onRemove;
  final void Function(Expense expense) onUndo;

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: 150,
          child: Text(
            "Grafik Bölümü",
            style: Theme.of(context).textTheme.titleLarge,
          ), // titleLarge stilini alması
        ),
        Expanded(
          child: ListView.builder(
              itemCount: widget.expenses.length,
              itemBuilder: (context, index) {
                return Dismissible(
                    key: ValueKey(widget.expenses[index]),
                    child: ExpenseItem(widget.expenses[index]),
                    onDismissed: (direction) {
                      Expense removedExpense = widget.expenses[index];
                      widget.onRemove(removedExpense);

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text('Mesaj silindi.'),
                          action: SnackBarAction(
                              label: 'Geri Al',
                              onPressed: () {
                                setState(() {
                                  widget.onUndo(removedExpense);
                                });
                              })));
                    });
              }),
        )
      ]),
    );
  }
}

// listeden veri silme ve alt başlıkları
// theming ve alt başlıkları