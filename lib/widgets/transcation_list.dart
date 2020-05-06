import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
 
	final List<Transaction> transactions;

	TransactionList({this.transactions});
	
  @override
  Widget build(BuildContext context) {
	  return Container(
		  height: 500,
	    child: ListView.builder(itemBuilder: (ctx,index){
		  return Card(child: Row(
			children: <Widget>[
				Container(
					padding: EdgeInsets.all(5),
					margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
					decoration: BoxDecoration(border: Border.all(color: Colors.purple,width: 1)),
					child: Text(
						'\$${transactions[index].amount.toStringAsFixed(2)}',
						style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold,fontSize: 20),
					),
				),
				Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: <Widget>[
						Text(transactions[index].title,
						style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
						Text(DateFormat.yMMMd().format(transactions[index].date),style: TextStyle(color: Colors.grey,fontSize: 15),),
					],
				),
			],
		),);
	    },
	    itemCount: transactions.length,),
	  );
  }
}