import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx) {
    print("Constructor newTransactionWidget ");
  }

  @override
  _NewTransactionState createState() {
    print("create newTransactionWidget");
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  _NewTransactionState() {
    print("Constructor newTransactionState ");
  }

  @override
  void initState() {
    print("initState() ");

    super.initState();
  }

  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    print("didUpdateWidget() ");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print("dispose() ");

    super.dispose();
  }

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Text(_selectedDate == null
                        ? "No date chose!"
                        : DateFormat.yMd().format(_selectedDate)),
                    Platform.isIOS
                        ? CupertinoButton(
                            onPressed: _presentDatePicker,
                            child: const Text(
                              "Choose Date",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        : FlatButton(
                            onPressed: _presentDatePicker,
                            child: const Text(
                              "Choose Date",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            textColor: Theme.of(context).textTheme.button.color,
                          )
                  ],
                ),
              ),
              RaisedButton(
                child: const Text('Add Transaction'),
                color: Colors.purple,
                textColor: Colors.white,
                onPressed: _submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
