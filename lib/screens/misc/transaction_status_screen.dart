import 'package:flutter/material.dart';
import 'package:vein_pay_wallet/main.dart';
import 'package:vein_pay_wallet/screens/layout/main_screen.dart';

class TransactionStatusScreen extends StatelessWidget {
  final bool isSuccess;
  final String amount;

  const TransactionStatusScreen({
    super.key,
    required this.isSuccess,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                isSuccess ? Icons.check_circle_outline : Icons.error_outline,
                color: isSuccess ? Colors.greenAccent : Colors.redAccent,
                size: 120,
              ),
              const SizedBox(height: 30),
              Text(
                isSuccess ? 'Payment Successful!' : 'Payment Failed',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              if (isSuccess)
                Text(
                  'You paid ₹ $amount to Green Grocers.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.grey[400]),
                ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: const Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Reusable Widgets ---

class TransactionTile extends StatelessWidget {
  final Transaction transaction;

  const TransactionTile({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final isTopUp = transaction.isTopUp;
    final amountColor = isTopUp ? Colors.greenAccent : Colors.white;
    final amountSign = isTopUp ? '+' : '-';
    final icon = isTopUp ? Icons.add_circle : Icons.store;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          child: Icon(icon, color: Theme.of(context).colorScheme.secondary),
        ),
        title: Text(
          transaction.shopName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${transaction.date.day}/${transaction.date.month}/${transaction.date.year}',
          style: TextStyle(color: Colors.grey[400]),
        ),
        trailing: Text(
          '$amountSign ₹${transaction.amount.toStringAsFixed(2)}',
          style: TextStyle(
            color: amountColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
