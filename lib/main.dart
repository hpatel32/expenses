import 'dart:io';

import 'package:expenses/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import './widgets/transcation_list.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        errorColor: Colors.red,
        primarySwatch: Colors.teal,
        fontFamily: "OpenSans",
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showChart = false;
  final List<Transaction> transactions = [
    // Transaction(
    //     tId: 't1', title: 'New Shoes', amount: 59.99, date: DateTime.now()),
    // Transaction(
    //     tId: 't2', title: 'New Shirt', amount: 29.99, date: DateTime.now())
  ];

  List<Transaction> get recentTransaction {
    return transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void deleteTx(id) {
    setState(() {
      transactions.removeWhere((tx) {
        return tx.tId == id;
      });
    });
  }

  void addNewTransaction(String title, double amount, DateTime choosenDate) {
    var newTx = Transaction(
        tId: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: choosenDate);
    setState(() {
      transactions.add(newTx);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewTransaction(addNewTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    bool _isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final app_bar = AppBar(
      title: Text('Expense Report'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            startAddNewTransaction(context);
          },
        ),
      ],
    );
    final txWidget = Container(
      height: (MediaQuery.of(context).size.height -
              app_bar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.6,
      child: TransactionList(transactions: transactions, deletetx: deleteTx),
    );
    return Scaffold(
      appBar: app_bar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                startAddNewTransaction(context);
              },
            ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (_isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Show Chart"),
                  Switch.adaptive(
                      value: _showChart,
                      onChanged: (val) {
                        setState(() {
                          _showChart = val;
                        });
                      }),
                ],
              ),
            if (!_isLandscape)
              Container(
                height: (MediaQuery.of(context).size.height -
                        app_bar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.3,
                child: Chart(recentTransaction),
              ),
            if (!_isLandscape) txWidget,
            if (_isLandscape)
              _showChart
                  ? Container(
                      height: (MediaQuery.of(context).size.height -
                              app_bar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.7,
                      child: Chart(recentTransaction),
                    )
                  : txWidget,
          ],
        ),
      ),
    );
  }
}
