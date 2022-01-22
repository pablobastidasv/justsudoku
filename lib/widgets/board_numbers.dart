import 'package:flutter/material.dart';
import 'package:just_sudoku/model/board.dart';
import 'package:just_sudoku/widgets/board.dart';
import 'package:provider/provider.dart';

class NumbersWidget extends StatelessWidget {
  const NumbersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var boardSize = context.read<BoardSize>();
    return Container(
      width: boardSize.boardSize,
      height: boardSize.cellSize,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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

    return Expanded(
      child: InkWell(
        onTap: () => Provider.of<BoardModel>(context, listen: false)
            .numberSelected(number),
        child: FittedBox(
          fit: BoxFit.fitHeight,
          child: Text(
            number,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: candidateEnabled
                    ? const Color(0x95030303) // TODO: Candidate number
                    : const Color(0xDA001AFF) // TODO: Defined number
                ),
          ),
        ),
      ),
    );
  }
}
