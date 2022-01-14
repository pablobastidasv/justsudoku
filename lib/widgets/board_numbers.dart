import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_sudoku/bloc/sudoku/sudoku_bloc.dart';

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
    return [for (var i = 1; i < 10; i += 1) NumberWidget(number: i)];
  }
}

class NumberWidget extends StatefulWidget {
  final int number;

  const NumberWidget({Key? key, required this.number}) : super(key: key);

  @override
  State<NumberWidget> createState() => _NumberWidgetState();
}

class _NumberWidgetState extends State<NumberWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<SudokuBloc>(context).add(NumberSelectedEvent(widget.number));
      },
      child: BlocBuilder<SudokuBloc, SudokuState>(
        buildWhen: (ctx, state) => state is SwitchCandidateState,
        builder: (context, state) {
          Color color =
              Theme.of(context).textTheme.bodyText1?.color ?? Colors.black;
          if (state is SwitchCandidateState && state.candidate) {
            color = Colors.grey;
          }
          return Text(
            '${widget.number}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 48,
              color: color,
            ),
          );
        },
      ),
    );
  }
}
