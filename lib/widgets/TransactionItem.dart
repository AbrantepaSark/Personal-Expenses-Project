import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      elevation: 5,
      child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: FittedBox(
              child: Text('\$${transaction.amount.toString()}'),
            ),
          ),
          title: Text(transaction.title),
          subtitle: Text(
            DateFormat.yMMMd().format(transaction.date),
            style: TextStyle(fontSize: 12),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete_rounded),
            onPressed: () {
              deleteTx(transaction.id);
            },
          )),
    );
  }
}
