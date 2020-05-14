import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  Function newTx;

  NewTransaction(this.newTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime selectedDate;

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || selectedDate == null) {
      return;
    }
    widget.newTx(enteredTitle, enteredAmount, selectedDate);
    Navigator.of(context).pop();
  }

  void selectDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((data) {
      print(data);
      if (data == null)
        return;
      else {
        setState(() {
          selectedDate = data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
              onSubmitted: (val) {
                submitData();
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
              controller: amountController,
              onSubmitted: (_) {
                submitData();
              },
            ),
            Container(
              height: 60,
              child: Row(
                children: <Widget>[
                  (selectedDate != null)
                      ? Text('${DateFormat.yMd().format(selectedDate)}')
                      : Text('No Date Chosen!'),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      selectDate();
                    },
                    child: Text(
                      'Select Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                submitData();
              },
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
