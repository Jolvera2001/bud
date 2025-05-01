import 'package:bud/screens/dashboard.dart';
import 'package:bud/screens/transactions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const BudApp());
}

class SomeModel {

}

class BudApp extends StatelessWidget {
  const BudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => SomeModel())
      ],
      child: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() =>  _MainAppNavState();
}

class _MainAppNavState extends State<MainApp> {
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
