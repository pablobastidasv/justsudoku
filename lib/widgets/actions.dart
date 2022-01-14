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
        const EraseButton(),
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

class EraseButton extends StatelessWidget {
  const EraseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      icon: Icons.clear,
      message: "Erase",
      onTab: _cleanCell,
    );
  }

  _cleanCell(BuildContext ctx) {
    BlocProvider.of<SudokuBloc>(ctx).add(CleanCell());
  }
}

class CandidateButton extends StatelessWidget {
  const CandidateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SudokuBloc, SudokuState>(
      buildWhen: (ctx, state) => state is SwitchCandidate,
      builder: (context, state) {
        var color =
            Theme.of(context).textTheme.bodyText1?.color ?? Colors.black;
        if (state is SwitchCandidate && state.candidate) {
          color = Colors.grey;
        }

        return ActionButton(
          icon: Icons.edit,
          message: "Candidate",
          onTab: (ctx) => _switchCandidate(ctx),
          color: color,
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
  final Color color;

  const ActionButton({
    Key? key,
    required this.icon,
    required this.message,
    required this.onTab,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
