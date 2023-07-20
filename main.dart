import 'package:flutter/material.dart';

void main() {
  runApp(BudgetTrackerApp());
}

class BudgetTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Monthly Budget Tracker'),
      centerTitle: true,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/coder.jpg'),
                  radius: 40.0,
                ),
              ),
              Divider(
                height: 60.0,
                color: Colors.grey[800],
              ),
              Text('NAMAN BANCHHOR'), // Display user information here
              SizedBox(height: 20),
              Text('My Monthly Budget'), // Display total expenses here
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExpenseScreen()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Net Monthly Savings: '),
                    SizedBox(width: 20.0),
                    Text('Rs 1,48,000'),
                    SizedBox(width: 40.0),
                    Icon(
                      Icons.account_balance
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpenseScreen extends StatelessWidget {
  final List<String> categories = ['Living Expenses:   1,65,000', 'Academic Expenses:  27,000', 'Recreational Expenses:  30,000']; // Replace with your categories

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Income-Expense Breakup'),
          centerTitle: true,),
      body: Column(
        children: [
          Text(
              'Salary Earned:  3,70,000',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
          ),
          Divider(
            height: 40.0,
            color: Colors.blueGrey,),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(categories[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExpenseListScreen(categoryName: categories[index])),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ExpenseListScreen extends StatelessWidget {
  final String categoryName;

  ExpenseListScreen({required this.categoryName});

  // You can replace this with actual expense data for the category
  final List<String> expenses = [
    'Expense 1',
    'Expense 2',
    'Expense 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(categoryName),
          centerTitle: true,),
      body: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(expenses[index]),
            trailing: Icon(Icons.delete_outlined),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddExpenseDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddExpenseDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Expense'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Add fields to enter expense value, description, etc. here
              TextField(
                decoration: InputDecoration(labelText: 'Expense Name'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Expense Amount (Rs)'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement the logic to save the expense here
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
