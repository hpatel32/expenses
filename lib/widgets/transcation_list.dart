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
		    	),
		  );
	    },
	    itemCount: transactions.length,),
	  );
  }
}
// Card(child: Row(
// 			children: <Widget>[
// 				Container(
// 					padding: EdgeInsets.all(5),
// 					margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
// 					decoration: BoxDecoration(border: Border.all(color: Theme.of(context).primaryColor,width: 1)),
// 					child: Text(
// 						'\$${transactions[index].amount.toStringAsFixed(2)}',
// 						style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 20),
// 					),
// 				),
// 				Column(
// 					crossAxisAlignment: CrossAxisAlignment.start,
// 					children: <Widget>[
// 						Text(transactions[index].title,
// 						style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
// 						Text(DateFormat.yMMMd().format(transactions[index].date),style: TextStyle(color: Colors.grey,fontSize: 15),),
// 					],
// 				),
// 			],
// 		),)