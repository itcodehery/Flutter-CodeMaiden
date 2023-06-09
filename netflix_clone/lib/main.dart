import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material3_layout/material3_layout.dart';

// sample to use pub.dev
void main() => const runApp(Jetflix());

class Jetflix extends StatefulWidget {
  const Jetflix({Key? key}) : super(key: key);

  @override
  JetflixState createState() => JetflixState();
}

class JetflixState extends State<Jetflix> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const JetflixHomePage(),
    );
  }
}

class JetflixHomePage extends StatelessWidget {
  const JetflixHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationScaffold(
      appBar: AppBar(
        title: const Text('Jetflix'),
        centerTitle: true,
      ),
      navigationSettings:
          RailAndBottomSettings(pages: <Widget>[], destinations: [
        DestinationModel(
          label: 'Home',
          icon: const Icon(Icons.home_outlined),
          selectedIcon: const Icon(Icons.home_filled),
          tooltip: 'Home page',
        ),
        DestinationModel(
          label: 'Users',
          icon: const Icon(Icons.group_outlined),
          selectedIcon: const Icon(Icons.group),
          tooltip: 'Users page',
        ),
      ]),
      navigationType: NavigationTypeEnum.railAndBottomNavBar,
      theme: Theme.of(context),
    );
  }
}
