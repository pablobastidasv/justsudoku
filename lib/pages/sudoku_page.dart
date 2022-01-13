import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_sudoku/bloc/sudoku/sudoku_bloc.dart';
import 'package:just_sudoku/widgets/actions.dart';
import 'package:just_sudoku/widgets/board.dart';
import 'package:just_sudoku/widgets/board_numbers.dart';
import 'package:just_sudoku/widgets/information.dart';

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
        body: BlocProvider(
          create: (context) => SudokuBloc(),
          child: Column(
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
