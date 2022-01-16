import 'package:flutter/material.dart';
import 'package:just_sudoku/model/board.dart';
import 'package:provider/provider.dart';

class NumbersWidget extends StatelessWidget {
  const NumbersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _widgets(),
      ),
    );
  }

  _widgets() {
    return [for (var i = 1; i < 10; i += 1) NumberWidget(number: '$i')];
  }
}

class NumberWidget extends StatelessWidget {
  final String number;

  const NumberWidget({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final candidateEnabled =
        context.select<BoardModel, bool>((board) => board.candidateEnabled);

    return InkWell(
      onTap: () => Provider.of<BoardModel>(context, listen: false)
          .numberSelected(number),
      child: Text(
        number,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 48,
            color: candidateEnabled ? Colors.grey : Colors.lightBlueAccent),
      ),
    );
  }
}
