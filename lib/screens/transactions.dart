import 'package:bud/viewmodels/transactions_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Transactions extends StatelessWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context){
    return Consumer<TransactionsViewmodel>(
      builder: (context, viewModel, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    "Transactions",
                    style: TextStyle(fontSize: 28),
                  ),
                ],
              ), 
            ),
            Divider(thickness: 1, height: 1,),
            Text(viewModel.name),
            TextField(
              onChanged: (value) => viewModel.updateName(value),
            )
          ],
        );
      }
    );
  }
}