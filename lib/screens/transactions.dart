import 'package:bud/components/generics/form_dialog.dart';
import 'package:bud/components/transaction_form.dart';
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
            ElevatedButton(
              onPressed: () async {
                final result = await showFormDialog<Map<String, String>>(
                  context: context, 
                  formLabel: "Test", 
                  form: TransactionForm()
                );

                if (result != null) {
                  print(result);
                }
              }, 
              child: Text("Open dialog"),
            ),
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