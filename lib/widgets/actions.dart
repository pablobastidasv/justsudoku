import 'package:flutter/material.dart';

class HelpersWidget extends StatelessWidget {
  const HelpersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        ActionButton(icon: Icons.undo, message: "Undo"),
        ActionButton(icon: Icons.clear, message: "Erase"),
        ActionButton(icon: Icons.edit, message: "Candidate"),
        ActionButton(icon: Icons.lightbulb, message: "Hint"),
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String message;

  const ActionButton({
    Key? key,
    required this.icon,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(icon),
        ),
        Text(message),
      ],
    );
  }
}
