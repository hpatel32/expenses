import 'package:flutter/material.dart';
import '../widgets/user_transaction.dart';

class NewTransaction extends StatelessWidget {
	Function newTx;
	final titleController = TextEditingController();
    final amountController = TextEditingController();
	NewTransaction(this.newTx);

	void submitData(){
		final enteredTitle = titleController.text;
		final enteredAmount = double.parse(amountController.text);
		if(enteredTitle.isEmpty || enteredAmount <= 0){
			return;
		}
		newTx(enteredTitle,enteredAmount);
	}
  @override
  Widget build(BuildContext context) {
	return Card(
		child: Container(
			padding: EdgeInsets.all(10),
		child: Column(
			crossAxisAlignment: CrossAxisAlignment.end,
			children: <Widget>[
				TextField(decoration: InputDecoration(labelText: 'Title'),controller: titleController,
				onSubmitted: (val){submitData();},),
				TextField(decoration: InputDecoration(labelText: 'Amount'),controller: amountController,onSubmitted: (_){submitData();},),
				FlatButton(onPressed: (){
					submitData();
				}, child: Text('Add Transaction',style: TextStyle(color: Colors.purple),)),
			],
			),
		),
	);
  }
}