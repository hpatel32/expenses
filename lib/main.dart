
import 'package:flutter/material.dart';
import './widgets/user_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
    
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Expense Report'),actions: <Widget>[
            IconButton(icon: Icon(Icons.add),onPressed: (){

            },),
            
        ],),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: (){

        },),
        body: SingleChildScrollView(
                  child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                  Container(
                      width: double.infinity,
                    child: Card(
                      child: Text('CHART',textAlign: TextAlign.center,),
                        elevation: 5,
                        color: Colors.blue,),
                  ),
                UserTransaction(),
              ],
          ),
        ),
    );
  }
}
