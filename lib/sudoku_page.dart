import 'package:flutter/material.dart';
import 'package:just_sudoku/actions.dart';
import 'package:just_sudoku/board.dart';
import 'package:just_sudoku/board_numbers.dart';
import 'package:just_sudoku/information.dart';

class SudokuPage extends StatelessWidget {
  const SudokuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .scaffoldBackgroundColor,
          elevation: 0,
        ),
        body: Column(
          children: const [
            InformationWidget(),
            SizedBox(height: 8),
            BoardWidget(),
            SizedBox(height: 8),
            HelpersWidget(),
            SizedBox(height: 8),
            NumbersWidget(),
          ],
        ),
      ),
    );
  }
}
