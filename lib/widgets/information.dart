import 'package:flutter/material.dart';
import 'package:just_sudoku/pages/sudoku_page.dart';

class InformationWidget extends StatelessWidget {
  final Level level;

  const InformationWidget({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildLevelInfo(),
      ],
    );
  }

  Widget _buildLevelInfo() {
    if (level == Level.easy()) return const Text('Fácil');
    if (level == Level.medium()) return const Text('Medio');
    if (level == Level.hard()) return const Text('Difícil');
    return const Text('Experto');
  }
}
