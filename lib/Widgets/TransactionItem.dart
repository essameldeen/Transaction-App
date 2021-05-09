import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transation_app/data/TransactionData.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$ ${transaction.amount}'),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
            DateFormat.yMMMd().format(transaction.date)),
        trailing: MediaQuery.of(context).size.width > 360
            ? FlatButton.icon(
            textColor: Theme.of(context).errorColor,
            onPressed: () {
              deleteTransaction(transaction.id);
            },
            icon: const Icon(Icons.delete),
            label: const Text("Delete"))
            : IconButton(
          icon: const Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () {
            deleteTransaction(transaction.id);
          },
        ),
      ),
    );
  }
}