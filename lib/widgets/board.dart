import 'package:flutter/material.dart';
import 'package:just_sudoku/model/board.dart';
import 'package:provider/provider.dart';

class BoardWidget extends StatelessWidget {
  const BoardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final board = context.watch<BoardModel>();

    final columns = List.generate(
      board.columns.length,
      (row) => List.generate(
        board.columns[row].length,
        (column) => ChangeNotifierProvider<CellModel>.value(
          value: board.columns[column][row],
          child: const CellWidget(),
        ),
        growable: false,
      ),
      growable: false,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            for (var column = 0; column < columns.length; column++)
              CellRow(cells: columns[column])
          ],
        ),
      ],
    );
  }
}

class CellRow extends StatelessWidget {
  final List<ChangeNotifierProvider> cells;

  const CellRow({Key? key, required this.cells}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: cells,
    );
  }
}

class CellWidget extends StatelessWidget {
  const CellWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boardModel = context.watch<BoardModel>();
    final cellModel = context.watch<CellModel>();
    final color = cellModel.error
        ? Colors.red
        : cellModel.selected
            ? const Color(0x920098EE) // TODO: selected
            : cellModel.highlighted
                ? const Color(0x160098EE) // TODO: highlighted
                : cellModel.indirectlyHighlighted
                    ? const Color(0x4F0098EE) // TODO: same number selected
                    : Colors.white70;

    final cellId = cellModel.id;
    final border = _buildBorder(cellId);
    final boxDecoration = BoxDecoration(border: border, color: color);
    final size = context.read<BoardSize>().cellSize;

    return InkWell(
      onTap: () => boardModel.selectCell(cellModel),
      child: Container(
        height: size,
        width: size,
        decoration: boxDecoration,
        child: cellModel.isCandidate
            ? CandidatesWidget(
                candidates: cellModel.candidates,
              )
            : NumberedCell(
                number: cellModel.number,
                isClue: cellModel.isClue,
                error: cellModel.error,
                relatedError: cellModel.relatedError,
              ),
      ),
    );
  }

  Border _buildBorder(CellId id) {
    const soft = BorderSide(width: 0.2);
    const strong = BorderSide(width: 1.8);

    var top = soft;
    var left = soft;
    var right = soft;
    var bottom = soft;

    if (id.column == 0) left = strong;
    if (id.row == 0) top = strong;

    if ((id.column + 1) % 3 == 0) right = strong;
    if ((id.row + 1) % 3 == 0) bottom = strong;

    return Border(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
    );
  }
}

class NumberedCell extends StatelessWidget {
  final String number;
  final bool isClue;
  final bool error;
  final bool relatedError;

  const NumberedCell({
    Key? key,
    required this.number,
    required this.isClue,
    required this.error,
    required this.relatedError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = error
        ? Colors.white
        : relatedError
            ? Colors.pink
            : isClue
                ? Colors.black // TODO: define clue color
                : const Color(0xDA001AFF); // TODO: defined number
    final String data = number == '0' ? '' : number;

    return FittedBox(
      fit: BoxFit.contain,
      child: Text(
        data,
        textAlign: TextAlign.center,
        style: TextStyle(color: color),
      ),
    );
  }
}

class CandidatesWidget extends StatelessWidget {
  final String candidates;

  const CandidatesWidget({
    Key? key,
    required this.candidates,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var candidatesStr = candidates.toString();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (var col = 0; col < 9; col += 3)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var row = 0; row < 3; row++)
                CandidateNumberWidget(number: candidatesStr[col + row]),
            ],
          ),
      ],
    );
  }
}

class CandidateNumberWidget extends StatelessWidget {
  final String number;

  const CandidateNumberWidget({Key? key, required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.read<BoardSize>().candidateSize;

    const color = Color(0x95030303); // TODO: Candidate numbers
    return Container(
      width: size,
      height: size,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Text(
          number == '0' ? '' : number,
          style: const TextStyle(color: color),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class BoardSize {
  final double screenSize;

  BoardSize(this.screenSize);

  double get candidateSize {
    return cellSize / 3.2;
  }

  double get boardSize => screenSize - factor;

  double get cellSize {
    return boardSize / 9;
  }

  double get factor {
    return this.screenSize > 600 ? 150 : 32;
  }
}