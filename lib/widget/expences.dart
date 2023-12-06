import 'package:expense_tracker/widget/chart/chart.dart';
import 'package:expense_tracker/widget/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/expenses_list/new_expence.dart';
import 'package:flutter/material.dart';

class Expence extends StatefulWidget {
  const Expence({super.key});
  @override
  State<Expence> createState() {
    return _Expence();
  }
}

class _Expence extends State<Expence> {
  final List<Expense> _registeredexpense = [
    Expense(
        title: 'Flutter Course',
        date: DateTime.now(),
        amount: 19.65,
        category: Category.work),
    Expense(
        title: 'Cinima',
        date: DateTime.now(),
        amount: 15.65,
        category: Category.leisure)
  ];
  void _openAddExpenceOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expnense) {
    setState(() {
      _registeredexpense.add(expnense);
    });
  }

  void _removeExpense(Expense expnense) {
    final expenseIndex = _registeredexpense.indexOf(expnense);
    setState(() {
      _registeredexpense.remove(expnense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense Deleted'),
        action: SnackBarAction(
            label: 'undo',
            onPressed: () {
              setState(() {
                _registeredexpense.insert(expenseIndex, expnense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expense found .start adding'),
    );
    if (_registeredexpense.isNotEmpty) {
      mainContent = ExpencesList(
          expenses: _registeredexpense, onRemoveExpense: _removeExpense);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expence Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenceOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(children: [
        Chart(expenses: _registeredexpense),
        Expanded(child: mainContent),
      ]),
    );
  }
}
