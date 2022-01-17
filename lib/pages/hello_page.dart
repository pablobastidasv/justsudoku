import 'package:flutter/material.dart';
import 'package:just_sudoku/pages/sudoku_page.dart';

class HelloPage extends StatelessWidget {
  const HelloPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LevelButton(label: "Fácil", level: Level.easy()),
            LevelButton(label: "Medio", level: Level.medium()),
            LevelButton(label: "Difícil", level: Level.hard()),
            LevelButton(label: "Experto", level: Level.expert()),
          ],
        ),
      ),
    );
  }
}

class LevelButton extends StatelessWidget {
  final String label;
  final Level level;

  const LevelButton({
    Key? key,
    required this.label,
    required this.level,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50), // NEW
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SudokuPage(level: level),
            ),
          );
        },
        child: Text(
          label,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
