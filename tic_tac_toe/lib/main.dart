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
  late List<String> cells; // List to track the state of each cell
  late bool isPlayer1Turn;

  @override
  void initState() {
    super.initState();
    resetGame();
  }

  void resetGame() {
    setState(() {
      // Initialize the game state
      cells = List<String>.filled(9, ''); // Empty cells
      isPlayer1Turn = true; // Player 1 ('X') starts the game
    });
  }

  void makeMove(int index) {
    if (cells[index].isEmpty) {
      setState(() {
        // Update the game state with the player's move
        cells[index] = isPlayer1Turn ? 'X' : 'O';
        isPlayer1Turn = !isPlayer1Turn; // Switch to the other player's turn
      });

      // Call functions to check for a win or a tie
      checkForWin();
      checkForTie();
    }
  }

  void checkForWin() {
    // Define the winning combinations
    final List<List<int>> winningCombinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
      [0, 4, 8], [2, 4, 6], // Diagonals
    ];

    for (final combination in winningCombinations) {
      final cell1 = cells[combination[0]];
      final cell2 = cells[combination[1]];
      final cell3 = cells[combination[2]];

      if (cell1.isNotEmpty && cell1 == cell2 && cell2 == cell3) {
        // We have a winner
        showWinDialog(cell1);
        return;
      }
    }
  }

  void checkForTie() {
    if (!cells.contains('')) {
      // All cells are filled, it's a tie
      showTieDialog();
    }
  }

  void showWinDialog(String winner) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Game Over'),
          content: Text('Player $winner wins!'),
          actions: [
            TextButton(
              onPressed: () {
                resetGame();
                Navigator.of(context).pop();
              },
              child: const Text("Play Again!"),
            )
          ],
        );
      },
    );
  }

  void showTieDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Game Over'),
          content: const Text("It's a tie!"),
          actions: [
            TextButton(
              onPressed: () {
                resetGame();
                Navigator.of(context).pop();
              },
              child: const Text('Play Again'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TicTacToe"),
          centerTitle: true,
        ),
        body: Column(children: [
          const SizedBox(height: 140),
          Expanded(
            child: Center(
              child: Padding(
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
                          makeMove(index);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.white, style: BorderStyle.solid),
                        ),
                        child: Center(
                          child: Text(cells[index],
                              style: const TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontFamily: 'SFProDisplay',
                                  fontWeight: FontWeight.normal)),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 2),
          ListTile(
            title: Text(
              isPlayer1Turn ? "X's Turn" : "O's Turn",
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            subtitle: const Text("Let the best one win!",
                style: TextStyle(color: Colors.white, fontSize: 14),
                textAlign: TextAlign.center),
          ),
          const SizedBox(height: 60),
        ]));
  }
}
