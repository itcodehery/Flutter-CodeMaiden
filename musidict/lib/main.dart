import 'package:flutter/material.dart';
import 'package:musidict/home.dart';
import 'package:musidict/library.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 1;

  static List<Widget> navigationPages = [
    const Home(),
    Library(),
  ];

  List<BottomNavigationBarItem> navItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.book_rounded), label: 'Library')
  ];

  void _onTapTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          canvasColor: const Color.fromARGB(255, 20, 20, 20),
          primaryColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        home: Scaffold(
          body: navigationPages[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
              items: List.of(navItems),
              currentIndex: selectedIndex,
              selectedItemColor: Colors.amber,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: false,
              onTap: _onTapTap),
        ));
  }
}
