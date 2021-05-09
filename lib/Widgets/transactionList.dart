import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transation_app/Widgets/TransactionItem.dart';
import 'package:transation_app/data/TransactionData.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

   const TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    print("build() Transaction List");
    return Container(
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constraint) {
              return Column(
                children: <Widget>[
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.title,
                  ),
                const   SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: constraint.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      )),
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionItem(transaction: transactions[index], deleteTransaction: deleteTransaction);
              },
              itemCount: transactions.length,
            ),
    );
  }
}


