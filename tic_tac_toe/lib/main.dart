import 'package:flutter/material.dart';

void main() {
  runApp(const TicTacToe());
}

class TicTacToe extends StatelessWidget {
  const TicTacToe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tic Tac Toe",
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          canvasColor: const Color.fromARGB(255, 14, 39, 60)),
      home: const TTTHomeScreen(),
    );
  }
}

class TTTHomeScreen extends StatefulWidget {
  const TTTHomeScreen({Key? key}) : super(key: key);

  @override
  TTTHomeScreenState createState() => TTTHomeScreenState();
}

class TTTHomeScreenState extends State<TTTHomeScreen> {
  String _gridVariable = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TicTacToe"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: GridView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        switch (index) {
                          case 0:
                            _gridVariable = 'X';
                            break;
                          case 1:
                            _gridVariable = 'Y';
                            break;
                          case 2:
                            _gridVariable = 'Z';
                            break;
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.white, style: BorderStyle.solid),
                      ),
                      child: Center(
                        child: Text(_gridVariable,
                            style: const TextStyle(
                                fontSize: 40, color: Colors.white)),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "You won the game!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
              ),
            )
          ],
        ));
  }
}
