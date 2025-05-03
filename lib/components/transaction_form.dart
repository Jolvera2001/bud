import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  @override 
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

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
              child: Text("Test Form", style: Theme.of(context).textTheme.headlineSmall),
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
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
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