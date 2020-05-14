import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
 
	final List<Transaction> transactions;
	final Function deletetx;

	TransactionList({this.transactions,this.deletetx});
	
  @override
  Widget build(BuildContext context) {
	  return Container(
		  height: 500,
	    child: transactions.isEmpty? Column(
			children: <Widget>[
				Text(
					"No transaction yet!",
					style: TextStyle(
						fontFamily: 'assets/fonts/OpenSans',
						fontWeight: FontWeight.bold,
						fontSize: 20
					),
				),
				SizedBox(height: 20,),
				Container(
					child: Image.asset('assets/images/waiting.png',fit: BoxFit.cover,),
					height: 200,
				),
			],
		) : ListView.builder(itemBuilder: (ctx,index){
		  return Card(
			  elevation: 5,
			  margin: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
					  child: ListTile(
			  	leading: CircleAvatar(
				  radius: 30,
				  child: Padding(
				    padding: const EdgeInsets.all(8.0),
				    child: FittedBox(
							child: Text(
							'\$${transactions[index].amount.toStringAsFixed(2)}',
						),
				    	),
				  ),
			  	),
				title: Text(transactions[index].title,style: TextStyle(fontWeight: FontWeight.bold),),
				subtitle: Text(DateFormat.yMMMd().format(transactions[index].date),style: TextStyle(color: Colors.grey,fontSize: 15),),
				trailing: IconButton(icon: Icon(Icons.delete),
				color: Theme.of(context).errorColor,
				onPressed: (){
					deletetx(transactions[index].tId);
				}),
		    	),
		  );
	    },
	    itemCount: transactions.length,),
	  );
  }
}