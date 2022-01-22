import 'package:flutter/material.dart';
import 'package:just_sudoku/model/board.dart';
import 'package:provider/provider.dart';

class HelpersWidget extends StatelessWidget {
  const HelpersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        EraseButton(),
        CandidateButton(),
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
      onTab: Provider.of<BoardModel>(context).eraseCell,
    );
  }
}

class CandidateButton extends StatelessWidget {
  const CandidateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final candidateEnabled =
        context.select<BoardModel, bool>((board) => board.candidateEnabled);

    var color = candidateEnabled
        ? const Color(0x95030303) // TODO: Candidate number
        : Theme.of(context).textTheme.bodyText1?.color ?? Colors.black;
    return Column(
      children: [
        Switch(
          value: !candidateEnabled,
          onChanged: (_) {
            Provider.of<BoardModel>(context, listen: false).switchCandidate();
          },
        ),
        Text(
          candidateEnabled ? 'Candidatos' : 'Fijo',
          style: TextStyle(color: color),
        )
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String message;

  // final Function(BuildContext) onTab;
  final Function() onTab;
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
          onPressed: onTab,
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
