import 'package:flutter/material.dart';

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
          onTab: () {},
        ),
        const EraseButton(),
        const CandidateButton(),
        ActionButton(
          icon: Icons.lightbulb,
          message: "Hint",
          onTab: () {},
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
      onTab: (){},
    );
  }
}

class CandidateButton extends StatelessWidget {
  const CandidateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).textTheme.bodyText1?.color ?? Colors.black;
    return ActionButton(
      icon: Icons.edit,
      message: "Candidate",
      onTab: () => {},
      color: color,
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
          onPressed: () {},
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
