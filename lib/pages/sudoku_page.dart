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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => BoardModel(level: level.number)),
        Provider(create: (_) => BoardSize(MediaQuery.of(context).size.width))
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Just Sudoku"),
          backgroundColor: const Color(0x40000000),
          elevation: 0,
        ),
        body: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 8),
                InformationWidget(level: level),
                const SizedBox(height: 3),
                const BoardWidget(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 8),
                      const HelpersWidget(),
                      const SizedBox(height: 8),
                      const NumbersWidget(),
                    ],
                  ),
                ),
              ],
            ),
            const GameEndedWidget(),
          ],
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
