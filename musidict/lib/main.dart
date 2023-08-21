import 'package:flutter/material.dart';
import 'package:musidict/Pages/home.dart';
import 'package:musidict/Pages/library.dart';
import 'package:musidict/Pages/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  static List<Widget> navigationPages = [
    const Home(),
    const Library(),
    const SearchPage(),
  ];

  List<BottomNavigationBarItem> navItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.book_rounded), label: 'Library'),
    const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search')
  ];

  void _onTapTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color defaultBGColor = const Color.fromARGB(255, 20, 20, 20);
    return MaterialApp(
      title: 'Cadence',
      theme: ThemeData(
          fontFamily: 'Segoe',
          canvasColor: defaultBGColor,
          primaryColor: const Color.fromARGB(255, 255, 255, 255),
          colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Colors.amber,
              onPrimary: Color.fromARGB(255, 20, 20, 20),
              secondary: Colors.amberAccent,
              onSecondary: Colors.black38,
              error: Colors.red,
              onError: Colors.white,
              background: Color.fromARGB(255, 20, 20, 20),
              onBackground: Colors.black,
              surface: Colors.black26,
              onSurface: Colors.white38)),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Cadence',
            style: TextStyle(
                color: Colors.amber,
                fontFamily: 'Segoe',
                fontWeight: FontWeight.w600,
                fontSize: 26,
                letterSpacing: 0),
          ),
          centerTitle: true,
          backgroundColor: defaultBGColor,
        ),
        body: navigationPages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            items: List.of(navItems),
            currentIndex: selectedIndex,
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: _onTapTap),
      ),
      routes: {
        "Home": (context) => const Home(),
        "Search": (context) => const SearchPage()
      },
    );
  }
}
