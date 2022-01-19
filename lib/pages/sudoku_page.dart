import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:just_sudoku/model/board.dart';
import 'package:just_sudoku/widgets/actions.dart';
import 'package:just_sudoku/widgets/board.dart';
import 'package:just_sudoku/widgets/board_numbers.dart';
import 'package:just_sudoku/widgets/game_ended_widget.dart';
import 'package:just_sudoku/widgets/information.dart';
import 'package:provider/provider.dart';

class SudokuPage extends StatelessWidget {
  final Level level;

  const SudokuPage({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => BoardModel(level: level.number),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            elevation: 0,
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  InformationWidget(level: level),
                  const SizedBox(height: 8),
                  const BoardWidget(),
                  const SizedBox(height: 8),
                  const HelpersWidget(),
                  const SizedBox(height: 8),
                  const NumbersWidget(),
                ],
              ),
              const GameEndedWidget(),
            ],
          ),
        ),
      ),
    );
  }
}



class Level extends Equatable {
  final int number;

  const Level(this.number);

  factory Level.beginner() => const Level(18);

  factory Level.easy() => const Level(27);

  factory Level.medium() => const Level(36);

  factory Level.hard() => const Level(54);

  @override
  List<Object> get props => [number];
}
