import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No Transactions Added yet',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 10,
                  width: 20,
                ),
                Container(
                    height: 200,
                    child: Image.asset('assets/images/kiran.png',
                        fit: BoxFit.cover)),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                              child: Text('\$${transactions[index].amount}')),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                      )),
                );
              },
              // child: Row(
              //   children: [
              //     Container(
              //       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              //       decoration: BoxDecoration(
              //         border: Border.all(
              //           color: Colors.purple,
              //           width: 2,
              //         ),
              //       ),
              //       padding: EdgeInsets.all(10),
              //       child: Text(
              //         '\$${transactions[index].amount.toStringAsFixed(2)}',
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 20,
              //         ),
              //       ),
              //     ),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           transactions[index].title,
              //           style: TextStyle(
              //             fontSize: 18,
              //             color: Colors.orange,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //         Text(
              //           DateFormat().add_yMMMd().format(transactions[index].date),
              //           style: TextStyle(
              //             color: Colors.grey,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),

              itemCount: transactions.length,
            ),
    );
  }
}
