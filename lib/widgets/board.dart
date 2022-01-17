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
    const size = 70.0;

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

    return Center(
      child: Text(
        data,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 48, color: color),
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CandidateNumberWidget(number: candidatesStr[0]),
            CandidateNumberWidget(number: candidatesStr[1]),
            CandidateNumberWidget(number: candidatesStr[2]),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CandidateNumberWidget(number: candidatesStr[3]),
            CandidateNumberWidget(number: candidatesStr[4]),
            CandidateNumberWidget(number: candidatesStr[5]),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CandidateNumberWidget(number: candidatesStr[6]),
            CandidateNumberWidget(number: candidatesStr[7]),
            CandidateNumberWidget(number: candidatesStr[8]),
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
    const color = Color(0x95030303); // TODO: Candidate numbers
    return Text(
      number == '0' ? '' : number,
      style: const TextStyle(color: color, fontSize: 19),
      textAlign: TextAlign.center,
    );
  }
}
