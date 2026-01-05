import 'package:flutter/material.dart';
import 'package:vein_pay_wallet/main.dart';
import 'package:vein_pay_wallet/screens/misc/transaction_status_screen.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  // More mock data for a full history
  final List<Transaction> _allTransactions = [
    Transaction(shopName: 'Green Grocers', amount: 25.50, date: DateTime.now()),
    Transaction(shopName: 'Coffee Corner', amount: 25.50, date: DateTime.now()),
    Transaction(
      shopName: 'Wallet Top-up',
      amount: 25.50,
      date: DateTime.now(),
      isTopUp: true,
    ),
    Transaction(shopName: 'Book Store', amount: 18.00, date: DateTime.now()),
    Transaction(
      shopName: 'Electronics Hub',
      amount: 299.99,
      date: DateTime.now(),
    ),
    Transaction(shopName: 'Cinema', amount: 15.00, date: DateTime.now()),
    Transaction(
      shopName: 'Wallet Top-up',
      amount: 200.00,
      date: DateTime.now(),
      isTopUp: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transaction History')),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: _allTransactions.length,
        itemBuilder: (context, index) {
          final tx = _allTransactions[index];
          return TransactionTile(transaction: tx);
        },
      ),
    );
  }
}
