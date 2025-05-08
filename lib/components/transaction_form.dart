import 'package:bud/models/model_enums.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Set<TransactionType> typeSelection = <TransactionType>{
    TransactionType.income,
  };
  Set<TransactionPattern> patternSelection = <TransactionPattern>{
    TransactionPattern.weekly,
  };
  bool isRecurring = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          Divider(),
          _buildForm(context),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "New Transaction",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close),
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Padding(
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
    );
  }

  Widget _buildForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SegmentedButton<TransactionType>(
            segments: const <ButtonSegment<TransactionType>>[
              ButtonSegment<TransactionType>(
                value: TransactionType.income,
                label: Text("income"),
              ),
              ButtonSegment<TransactionType>(
                value: TransactionType.expense,
                label: Text("expense"),
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
          CheckboxListTile(
            title: Text("Repeating?"),
            value: isRecurring,
            onChanged: (bool? value) {
              setState(() {
                isRecurring = value ?? false;
              });
            },
          ),
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(2010),
            lastDay: DateTime.utc(2030),
          ),
          DropdownButtonFormField<TransactionPattern>(
            decoration: InputDecoration(
              labelText: "Frequency",
              border: OutlineInputBorder(),
            ),
            value: patternSelection.first,
            items: [
              DropdownMenuItem(
                value: TransactionPattern.weekly,
                child: Text("Weekly"),
              ),
              DropdownMenuItem(
                value: TransactionPattern.biweekly,
                child: Text("Biweekly"),
              ),
              DropdownMenuItem(
                value: TransactionPattern.bimonthly,
                child: Text("Bimonthly"),
              ),
              DropdownMenuItem(
                value: TransactionPattern.monthly,
                child: Text("Monthly"),
              ),
              DropdownMenuItem(
                value: TransactionPattern.annually,
                child: Text("Annually"),
              ),
            ],
            onChanged: (value) {
              setState(() {
                patternSelection = {value!};
              });
            },
          ),
          SizedBox(height: 16),
          typeSelection.first == TransactionType.income
              ? Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      _stringValidate(value);
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Source",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(width: 8),
                ],
              )
              : Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            _stringValidate(value);
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Payee",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            _stringValidate(value);
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Method",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          SizedBox(height: 16),
          Divider(),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              labelText: "Amount",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  String? _stringValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty';
    }
    return null;
  }
}
