import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import '../widgets/chart_bar.dart';

class Chart extends StatelessWidget {
	final List<Transaction> txs;

	Chart(this.txs);

	List<Map<String,Object>> get groupTransaction{
		return List.generate(7, (index) {
			final weekDays = DateTime.now().subtract(Duration(days: index));
			var totalSum=0.0;
			for (var i = 0; i < txs.length; i++) {
			  if (txs[i].date.day == weekDays.day && txs[i].date.month == weekDays.month && txs[i].date.year == weekDays.year) {
				totalSum += txs[i].amount;
			  }
			}
			return {'day':DateFormat.E().format(weekDays), 'amount':totalSum};
		}).reversed.toList();
	}

	double get totalSpending{
		return groupTransaction.fold(0.0, (sum,item){
			return sum += item['amount'];
		});
	}

  @override
  Widget build(BuildContext context) {
	  print(groupTransaction);
	return Card(
		elevation: 6,
		margin: EdgeInsets.all(20),
	  	child: Padding(
	  	  padding: EdgeInsets.all(8.0),
	  	  child: Row(
			  mainAxisAlignment: MainAxisAlignment.spaceAround,
			  children: <Widget>[
				  for (var item in groupTransaction) ChartBar(item['day'], item['amount'], (totalSpending == 0.0)? 0.0 : (item['amount'] as double)/totalSpending),
			  ],
		  ),
	  	),
	);
  }
}