import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_sudoku/bloc/sudoku/sudoku_bloc.dart';
import 'package:just_sudoku/model/board.dart';

class BoardWidget extends StatelessWidget {
  const BoardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final columns = List.generate(
      defaultBoardSize,
      (row) => List.generate(
        defaultBoardSize,
        (column) => CellWidget(id: CellId(column, row)),
        growable: false,
      ),
      growable: false,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            for (var column = 0; column < defaultBoardSize; column++)
              CellRow(cells: columns[column])
          ],
        ),
      ],
    );
  }
}

class CellRow extends StatelessWidget {
  final List<CellWidget> cells;

  const CellRow({Key? key, required this.cells}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

class _CellWidgetState extends State<CellWidget> {
  _CellWidgetState();

  final size = 70.0;
  Cell? cell;

  @override
  Widget build(BuildContext context) {
    final border = _buildBorder();

    return InkWell(
      onTap: () {
        BlocProvider.of<SudokuBloc>(context).add(CellSelectedEvent(widget.id));
      },
      child: BlocBuilder<SudokuBloc, SudokuState>(
        buildWhen: (ctx, state) {
          return (state is SelectedCellState || state is SelectedNumberState);
        },
        builder: (context, state) {
          var boxDecoration = BoxDecoration(border: border);
          if (state is CellInfo) {
            final color = _buildCellColor(state);
            boxDecoration = BoxDecoration(border: border, color: color);
          }

          if (state is SelectedNumberState && state.id == widget.id) {
            cell = state.cell;
          }

          return Container(
            height: size,
            width: size,
            decoration: boxDecoration,
            child: cell?.candidate ?? false
                ? CandidatesWidget(
                    candidates: cell?.candidates ?? Candidates(),
                  )
                : NumberedCell(number: cell?.number ?? 0),
          );
        },
      ),
    );
  }

  Color _buildCellColor(CellInfo state) {
    if (state.id == widget.id) {
      return Colors.indigo;
    } else if (state.id.column == widget.id.column) {
      return Colors.lightBlueAccent;
    } else if (state.id.row == widget.id.row) {
      return Colors.lightBlueAccent;
    }
    return Theme.of(context).scaffoldBackgroundColor;
  }

  Border _buildBorder() {
    const soft = BorderSide(width: 0.2);
    const strong = BorderSide(width: 1.8);

    var top = soft;
    var left = soft;
    var right = soft;
    var bottom = soft;

    if (widget.id.column == 0) left = strong;
    if (widget.id.row == 0) top = strong;

    if ((widget.id.column + 1) % 3 == 0) right = strong;
    if ((widget.id.row + 1) % 3 == 0) bottom = strong;

    return Border(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
    );
  }
}

class NumberedCell extends StatelessWidget {
  final int number;

  const NumberedCell({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String data = number == 0 ? '' : '$number';
    return Center(
      child: Text(
        data,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 48),
      ),
    );
  }
}

class CandidatesWidget extends StatelessWidget {
  final Candidates candidates;

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
    return Text(
      number == '0' ? '' : number,
      style: const TextStyle(color: Colors.grey, fontSize: 19),
    );
  }
}
