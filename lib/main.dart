
import 'package:expenses/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import './widgets/transcation_list.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
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
    void startAddNewTransaction(BuildContext ctx){
        showModalBottomSheet(context: ctx, builder: (_){
            return GestureDetector(
                child: NewTransaction(addNewTransaction),
                onTap: (){},
                behavior: HitTestBehavior.opaque,
            );
        });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Expense Report'),
            actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.add),
                    onPressed: (){
                        startAddNewTransaction(context);
                    },
                ),
            ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){
                startAddNewTransaction(context);
            },
        ),
        body: SingleChildScrollView(
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                    Container(
                        width: double.infinity,
                        child: Card(
                            child: Text('CHART',
                                textAlign: TextAlign.center,
                            ),
                            elevation: 5,
                            color: Colors.blue,
                        ),
                    ),
                    TransactionList(transactions:transactions),
                ],
            ),
        ),
    );
  }
}
