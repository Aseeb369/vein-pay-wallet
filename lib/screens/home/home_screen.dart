import 'package:flutter/material.dart';
import 'package:vein_pay_wallet/main.dart';
import 'package:vein_pay_wallet/screens/misc/transaction_status_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _currentBalance = 1245;

  final List<Transaction> _recentTransactions = [
    Transaction(shopName: 'Green Grocers', amount: 25, date: DateTime.now()),
    Transaction(shopName: 'Coffee Corner', amount: 25, date: DateTime.now()),
    Transaction(
      shopName: 'Wallet Top-up',
      amount: 100.00,
      date: DateTime.now(),
      isTopUp: true,
    ),
  ];

  void _addMoney(double amount) {
    setState(() {
      _currentBalance += amount;
      _recentTransactions.insert(
        0,
        Transaction(
          shopName: 'Wallet Top-up',
          amount: amount,
          date: DateTime.now(),
          isTopUp: true,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vein-PAY')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// Balance Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Balance',
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '₹ ${_currentBalance.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            /// Add Money Button
            ElevatedButton.icon(
              onPressed: () async {
                final amount = await Navigator.push<double>(
                  context,
                  MaterialPageRoute(builder: (_) => const AddMoneyScreen()),
                );

                if (amount != null && amount > 0) {
                  _addMoney(amount);
                }
              },
              icon: const Icon(Icons.add_circle_outline),
              label: const Text('Add Money'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 32),

            Text(
              'Recent Activity',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: _recentTransactions.length,
                itemBuilder: (context, index) {
                  return TransactionTile(
                    transaction: _recentTransactions[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddMoneyScreen extends StatefulWidget {
  const AddMoneyScreen({super.key});

  @override
  State<AddMoneyScreen> createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends State<AddMoneyScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Money')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Enter Amount', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 12),

            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixText: '₹ ',
                hintText: '0.00',
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              style: const TextStyle(fontSize: 24),
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                final amount = double.tryParse(_controller.text);
                if (amount != null && amount > 0) {
                  Navigator.pop(context, amount);
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Add to Wallet',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
