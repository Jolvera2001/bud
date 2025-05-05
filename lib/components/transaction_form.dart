import 'package:bud/models/model_enums.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({super.key});
  
  @override 
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Set<TransactionType> typeSelection = <TransactionType>{TransactionType.income};
  Set<TransactionPattern> patternSelection = <TransactionPattern>{TransactionPattern.weekly};
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("New Transaction", style: Theme.of(context).textTheme.headlineSmall),
            ),
            IconButton(
              onPressed: () =>  Navigator.pop(context),
              icon: Icon(Icons.close)
            ),
          ],
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SegmentedButton<TransactionType>(
                segments: const <ButtonSegment<TransactionType>>[
                  ButtonSegment<TransactionType>(
                    value: TransactionType.income,
                    label: Text("income")
                  ),
                  ButtonSegment<TransactionType>(
                    value: TransactionType.expense,
                    label: Text("expense")
                  ),
                ], 
                selected: typeSelection,
                onSelectionChanged: (Set<TransactionType> newSelection) {
                  setState(() {
                    typeSelection = newSelection;
                  });
                },
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: "Name"
                ),
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  labelText: "Amount"
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<TransactionPattern>(
                decoration: InputDecoration(
                  labelText: "Frequency",
                  border: OutlineInputBorder()
                ),
                value: patternSelection.first,
                items: [
                  DropdownMenuItem(value: TransactionPattern.weekly, child: Text("Weekly")),
                  DropdownMenuItem(value: TransactionPattern.biweekly, child: Text("Biweekly")),
                  DropdownMenuItem(value: TransactionPattern.bimonthly, child: Text("Bimonthly")),
                  DropdownMenuItem(value: TransactionPattern.monthly, child: Text("Monthly")),
                  DropdownMenuItem(value: TransactionPattern.annually, child: Text("Annually")),
                ],
                onChanged: (value) {
                  setState(() {
                    patternSelection = {value!};
                  });
                }
              ),
              // SegmentedButton<TransactionPattern>(
              //   segments: const <ButtonSegment<TransactionPattern>>[
              //     ButtonSegment<TransactionPattern>(
              //       value: TransactionPattern.weekly,
              //       label: Text("weekly", overflow: TextOverflow.ellipsis)
              //     ),
              //     ButtonSegment<TransactionPattern>(
              //       value: TransactionPattern.biweekly,
              //       label: Text("biweekly", overflow: TextOverflow.ellipsis)
              //     ),
              //     ButtonSegment<TransactionPattern>(
              //       value: TransactionPattern.bimonthly,
              //       label: Text("bimonthly", overflow: TextOverflow.ellipsis)
              //     ),
              //     ButtonSegment<TransactionPattern>(
              //       value: TransactionPattern.monthly,
              //       label: Text("monthly", overflow: TextOverflow.ellipsis)
              //     ),
              //     ButtonSegment<TransactionPattern>(
              //       value: TransactionPattern.annually,
              //       label: Text("annually", overflow: TextOverflow.ellipsis)
              //     ),
              //   ], 
              //   selected: patternSelection,
              //   onSelectionChanged: (Set<TransactionPattern> newSelection) {
              //     setState(() {
              //       patternSelection = newSelection;
              //     });
              //   },
              // ),
              typeSelection.first == TransactionType.income 
                ? Text("Income selected")
                : Text("Expense selected")
              // TextField(
              //   controller: _nameController,
              //   decoration: InputDecoration(
              //     labelText: 'Name',
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              // SizedBox(height: 16),
              // TextField(
              //   controller: _descriptionController,
              //   decoration: InputDecoration(
              //     labelText: 'Description',
              //     border: OutlineInputBorder(),
              //   ),
              //   maxLines: 3,
              // ),
            ],
          ),
        ),
         Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text('Cancel'),
                onPressed: () => Navigator.pop(context),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                child: Text('Save'),
                onPressed: () {
                  // Return a simple map with the form data
                  final result = {
                    'name': _nameController.text,
                    'description': _descriptionController.text,
                  };
                  Navigator.pop(context, result);
                },
              ),
            ],
          ),
         ),
      ],
    );
  }
}