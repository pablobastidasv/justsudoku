import 'package:flutter/material.dart';
import 'package:just_sudoku/model/board.dart';
import 'package:just_sudoku/widgets/actions.dart';
import 'package:just_sudoku/widgets/board.dart';
import 'package:just_sudoku/widgets/board_numbers.dart';
import 'package:just_sudoku/widgets/information.dart';
import 'package:provider/provider.dart';

class SudokuPage extends StatelessWidget {
  const SudokuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => BoardModel(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
      ),
    );
  }
}
