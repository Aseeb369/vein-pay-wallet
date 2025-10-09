import 'package:flutter/material.dart';
import 'dart:async';

// Main function to run the Flutter application
void main() {
  runApp(const VeinPayApp());
}

// --- Data Models ---
// A simple class to represent a transaction
class Transaction {
  final String shopName;
  final double amount;
  final DateTime date;
  final bool isTopUp;

  Transaction({
    required this.shopName,
    required this.amount,
    required this.date,
    this.isTopUp = false,
  });
}

// --- Main App Widget ---
class VeinPayApp extends StatelessWidget {
  const VeinPayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vein-PAY',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF6A1B9A), // Deep Purple
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF8E44AD), // Amethyst
          secondary: Color(0xFF03DAC6), // Teal Accent
          surface: Color(0xFF1E1E1E),
          onPrimary: Colors.white,
          onSecondary: Colors.black,
        ),
        cardTheme: CardThemeData(
          color: const Color(0xFF1E1E1E),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8E44AD),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          elevation: 0,
          centerTitle: true,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF1E1E1E),
          selectedItemColor: Color(0xFF03DAC6),
          unselectedItemColor: Colors.grey,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF2C2C2C),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// --- Authentication Screens ---

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.fingerprint,
                  size: 80,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(height: 20),
                Text(
                  'Welcome to Vein-PAY',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Secure payments at your fingertips.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[400]),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MainScreen()),
                      );
                    }
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegistrationScreen()),
                      );
                  },
                  child: Text(
                    'Create New Account',
                    style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(decoration: const InputDecoration(labelText: 'Full Name')),
            const SizedBox(height: 16),
            TextFormField(decoration: const InputDecoration(labelText: 'Email')),
            const SizedBox(height: 16),
            TextFormField(decoration: const InputDecoration(labelText: 'Phone Number')),
             const SizedBox(height: 16),
            TextFormField(decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PalmVeinEnrollmentScreen()),
                );
              },
              child: const Text('Next: Secure Your Account'),
            ),
          ],
        ),
      ),
    );
  }
}

class PalmVeinEnrollmentScreen extends StatelessWidget {
  const PalmVeinEnrollmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Palm Vein Enrollment')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Icon(
              Icons.camera_alt,
              size: 100,
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(height: 20),
            const Text(
              'Position your palm over the scanner to register your unique vein pattern.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
             const SizedBox(height: 40),
            // Placeholder for the actual camera feed/guide
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16)
              ),
              child: const Center(child: Text('Scanner Area', style: TextStyle(color: Colors.grey))),
            ),
             const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Simulate successful enrollment and navigate to the main app
                 Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text('Scan & Complete Setup'),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Main Application Screens (with Bottom Navigation) ---

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
     HomeScreen(),
     HistoryScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

// --- Home Screen ---

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  // Mock data for recent transactions
  final List<Transaction> _recentTransactions =  [
    Transaction(shopName: 'Green Grocers', amount: 25.50,  date: DateTime.now(),),
    Transaction(shopName: 'Coffee Corner', amount: 25.50, date: DateTime.now()),
    Transaction(shopName: 'Wallet Top-up', amount: 100.00,  date: DateTime.now(), isTopUp: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vein-PAY'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Wallet Balance Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Current Balance', style: TextStyle(color: Colors.grey[400])),
                    const SizedBox(height: 8),
                    const Text(
                      '₹ 1,245.30',
                      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const EnterAmountScreen()));
                    },
                    icon: const Icon(Icons.qr_code_scanner),
                    label: const Text('Pay'),
                     style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                 Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add_circle_outline),
                    label: const Text('Add Money'),
                     style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2C2C2C),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            // Recent Transactions
            Text('Recent Activity', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _recentTransactions.length,
                itemBuilder: (context, index) {
                  final tx = _recentTransactions[index];
                  return TransactionTile(transaction: tx);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- History Screen ---

class HistoryScreen extends StatelessWidget {
   HistoryScreen({super.key});

  // More mock data for a full history
  final List<Transaction> _allTransactions =  [
      Transaction(shopName: 'Green Grocers', amount: 25.50, date: DateTime.now()),
      Transaction(shopName: 'Coffee Corner', amount: 25.50, date: DateTime.now()),
      Transaction(shopName: 'Wallet Top-up',amount: 25.50, date: DateTime.now(), isTopUp: true),
      Transaction(shopName: 'Book Store', amount: 18.00,  date: DateTime.now(),),
      Transaction(shopName: 'Electronics Hub', amount: 299.99,  date: DateTime.now(),),
      Transaction(shopName: 'Cinema', amount: 15.00,  date: DateTime.now(),),
      Transaction(shopName: 'Wallet Top-up', amount: 200.00,  date: DateTime.now(), isTopUp: true),
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

// --- Profile Screen ---

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xFF8E44AD),
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 10),
          const Text('Aseeb Abubacker', textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text('aseeb@email.com', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[400])),
          const SizedBox(height: 30),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit Profile'),
            onTap: () {},
          ),
           ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Security & Privacy'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.fingerprint),
            title: const Text('Manage Palm Vein'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Help & Support'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red[400]),
            title: Text('Logout', style: TextStyle(color: Colors.red[400])),
            onTap: () {
               Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (Route<dynamic> route) => false,
                );
            },
          ),
        ],
      ),
    );
  }
}

// --- Payment Flow Screens ---

class EnterAmountScreen extends StatefulWidget {
  const EnterAmountScreen({super.key});

  @override
  _EnterAmountScreenState createState() => _EnterAmountScreenState();
}

class _EnterAmountScreenState extends State<EnterAmountScreen> {
  String _amount = "0";

  void _onKeyPress(String value) {
    setState(() {
      if (value == "<-") {
        _amount = _amount.length > 1 ? _amount.substring(0, _amount.length - 1) : "0";
      } else {
        if (_amount == "0") {
          _amount = value;
        } else {
          _amount += value;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enter Amount')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                '₹ $_amount',
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Custom Numeric Keypad
          _buildKeypad(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: (double.tryParse(_amount) ?? 0) > 0
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfirmPaymentScreen(amount: _amount),
                        ),
                      );
                    }
                  : null,
              child: const Text('Proceed to Pay'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeypad() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 2,
      children: [
        '1', '2', '3',
        '4', '5', '6',
        '7', '8', '9',
        '.', '0', '<-',
      ].map((key) {
        return InkWell(
          onTap: () => _onKeyPress(key),
          child: Center(
            child: Text(
              key,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class ConfirmPaymentScreen extends StatelessWidget {
  final String amount;
  const ConfirmPaymentScreen({super.key, required this.amount});

  void _showAuthenticationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // Simulate a delay for biometric scanning
        Timer(const Duration(seconds: 3), () {
          Navigator.of(context).pop(); // Close the dialog
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => TransactionStatusScreen(
                isSuccess: true, // Simulate success
                amount: amount,
              ),
            ),
          );
        });

        return const AlertDialog(
          title: Text('Authenticating...'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              SizedBox(height: 20),
              Text('Scanning palm vein... Please hold still.'),
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Confirm Payment')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Paying to:', textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
            const Text('Green Grocers', textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            Text('₹ $amount', textAlign: TextAlign.center, style: const TextStyle(fontSize: 52, fontWeight: FontWeight.bold)),
            const Spacer(),
            ElevatedButton.icon(
              icon: const Icon(Icons.fingerprint),
              label: const Text('Confirm & Scan Palm'),
               style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20),
              ),
              onPressed: () => _showAuthenticationDialog(context),
            ),
             const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}


class TransactionStatusScreen extends StatelessWidget {
  final bool isSuccess;
  final String amount;

  const TransactionStatusScreen({super.key, required this.isSuccess, required this.amount});

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
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
        title: Text(transaction.shopName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(
          '${transaction.date.day}/${transaction.date.month}/${transaction.date.year}',
          style: TextStyle(color: Colors.grey[400]),
        ),
        trailing: Text(
          '$amountSign ₹${transaction.amount.toStringAsFixed(2)}',
          style: TextStyle(
            color: amountColor,
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),
        ),
      ),
    );
  }
}
