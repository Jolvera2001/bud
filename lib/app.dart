import 'package:bud/screens/dashboard.dart';
import 'package:bud/screens/transactions.dart';
import 'package:flutter/material.dart';

class BudApp extends StatefulWidget {
  const BudApp({super.key});

  @override
  State<BudApp> createState() =>  _MainAppNavState();
}

class _MainAppNavState extends State<BudApp> {
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;

  // screens
  final List<Widget> _screens = const [
    Dashboard(),
    Transactions()
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: _selectedIndex,
              labelType: labelType,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              destinations: const <NavigationRailDestination> [
                  NavigationRailDestination(
                    icon: Icon(Icons.dashboard_outlined),
                    selectedIcon: Icon(Icons.dashboard), 
                    label: Text("Dashboard")
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.add_to_photos_outlined),
                    selectedIcon: Icon(Icons.add_to_photos), 
                    label: Text("Transactions")
                  )
              ]
            ),
            const VerticalDivider(thickness: 1, width: 1),

            // main content
            Expanded(
              child: _screens[_selectedIndex],
            ),
          ],
        ),
      ),
    );
  }
}