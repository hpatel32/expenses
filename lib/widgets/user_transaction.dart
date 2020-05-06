import 'package:flutter/material.dart';
import '../widgets/new_transaction.dart';
import '../widgets/transcation_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
	final List<Transaction> transactions = [
        Transaction(tId: 't1',title: 'New Shoes',amount: 59.99,date: DateTime.now()),
        Transaction(tId: 't2',title: 'New Shirt',amount: 29.99,date: DateTime.now())
    ];
	void addNewTransaction(String title,double amount){
		var newTx = Transaction(title: title,amount: amount,tId: DateTime.now().toString(),date: DateTime.now());
		setState(() {
		  transactions.add(newTx);
		});
	}
  @override
  Widget build(BuildContext context) {
	return Column(
		children: <Widget>[
			NewTransaction(addNewTransaction),
			TransactionList(transactions: transactions),
		],
	);
  }
}