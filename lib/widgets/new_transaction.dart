import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import './user_transactions.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;
  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController amountController = TextEditingController();
  DateTime pickedDate;

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredAmount == null) {
      return;
    }
    if (enteredTitle.isEmpty || enteredAmount <= 0 || pickedDate == null) {
      return;
    }
    widget.addTransaction(enteredTitle, enteredAmount, pickedDate);
    Navigator.of(context).pop();
  }

  void datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) {
        return;
      }
      setState(() {
        pickedDate = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(labelText: 'Title'),
                    // onSubmitted: (_) => submitData(),
                  ),
                  TextField(
                    controller: amountController,
                    decoration: InputDecoration(labelText: 'Amount'),
                    keyboardType: TextInputType.number,
                    // onSubmitted: (_) => submitData(),
                  ),
                  Container(
                      height: 70,
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(pickedDate == null
                                  ? 'No date selected'
                                  : 'Selected date: ${DateFormat.yMd().format(pickedDate)}')),
                          TextButton(
                              onPressed: datePicker, child: Text('Select Date'))
                        ],
                      )),
                  ElevatedButton(
                      onPressed: submitData, child: Text('Add Transaction'))
                ],
              ))),
    );
  }
}
