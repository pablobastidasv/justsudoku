import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_sudoku/bloc/sudoku/sudoku_bloc.dart';

class HelpersWidget extends StatelessWidget {
  const HelpersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ActionButton(
          icon: Icons.undo,
          message: "Undo",
          onTab: (ctx) {},
        ),
        ActionButton(
          icon: Icons.clear,
          message: "Erase",
          onTab: (ctx) {},
        ),
        const CandidateButton(),
        ActionButton(
          icon: Icons.lightbulb,
          message: "Hint",
          onTab: (ctx) {},
        ),
      ],
    );
  }
}

class CandidateButton extends StatelessWidget {
  const CandidateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SudokuBloc, SudokuState>(
      builder: (context, state) {
        if (state is SwitchCandidate && state.candidate) {
          return ActionButton(
            icon: Icons.edit,
            message: "Candidate",
            onTab: (ctx) => _switchCandidate(ctx),
            color: Colors.grey,
          );
        }

        return ActionButton(
          icon: Icons.edit,
          message: "Candidate",
          onTab: (ctx) => _switchCandidate(ctx),
        );
      },
    );
  }

  _switchCandidate(BuildContext context) =>
      BlocProvider.of<SudokuBloc>(context).add(CandidateSwitched());
}


class ActionButton extends StatelessWidget {
  final IconData icon;
  final String message;
  final onTab;
  final color;

  const ActionButton({
    Key? key,
    required this.icon,
    required this.message,
    required this.onTab,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          IconButton(
            onPressed: () => onTab(context),
            icon: Icon(
              icon,
              color: color,
            ),
          ),
          Text(
            message,
            style: TextStyle(color: color),
          ),
        ],
      );
  }
}
