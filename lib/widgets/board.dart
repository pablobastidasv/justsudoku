import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BoardWidget extends StatelessWidget {
  const BoardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final columns = [for (var i = 0; i < 9; i += 1) CellRow(rowId: i)];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: columns,
        ),
      ],
    );
  }
}

class CellRow extends StatelessWidget {
  final int rowId;

  const CellRow({Key? key, required this.rowId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cells = [
      for (var i = 0; i < 9; i += 1) CellWidget(id: CellId(rowId, i))
    ];
    return Row(
      children: cells,
    );
  }
}

class CellWidget extends StatefulWidget {
  final CellId id;

  const CellWidget({Key? key, required this.id}) : super(key: key);

  @override
  State<CellWidget> createState() => _CellWidgetState();
}

class CellId extends Equatable {
  final int line;
  final int column;

  const CellId(this.line, this.column)
      : assert(line >= 0 && line <= 8),
        assert(column >= 0 && column <= 8);

  @override
  List<Object> get props => [line, column];
}

class _CellWidgetState extends State<CellWidget> {
  _CellWidgetState();

  @override
  Widget build(BuildContext context) {
    const size = 80.0;
    final border = _buildBorder();

    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(border: border),
      child: const NumberedCell(),
    );
  }

  Border _buildBorder() {
    const soft = BorderSide(width: 0.2);
    const strong = BorderSide(width: 1.8);

    var top = soft;
    var left = soft;
    var right = soft;
    var bottom = soft;

    if (widget.id.column == 0) left = strong;
    if (widget.id.line == 0) top = strong;

    if ((widget.id.column + 1) % 3 == 0) right = strong;
    if ((widget.id.line + 1) % 3 == 0) bottom = strong;

    return Border(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
    );
  }
}

class NumberedCell extends StatelessWidget {
  const NumberedCell({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '9',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 48),
      ),
    );
  }
}

class CandidatesWidget extends StatelessWidget {
  const CandidatesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            CandidateNumberWidget(number: 1),
            CandidateNumberWidget(number: 2),
            CandidateNumberWidget(number: 3),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            CandidateNumberWidget(number: 4),
            CandidateNumberWidget(number: 5),
            CandidateNumberWidget(number: 6),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            CandidateNumberWidget(number: 7),
            CandidateNumberWidget(number: 8),
            CandidateNumberWidget(number: 9),
          ],
        ),
      ],
    );
  }
}

class CandidateNumberWidget extends StatelessWidget {
  final int number;

  const CandidateNumberWidget({Key? key, required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$number',
      style: const TextStyle(color: Colors.grey, fontSize: 21),
    );
  }
}
