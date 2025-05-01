import 'package:flutter/material.dart';

class Transactions extends StatelessWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context){
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
        Divider(thickness: 1, height: 1,)
      ],
    );
  }
}