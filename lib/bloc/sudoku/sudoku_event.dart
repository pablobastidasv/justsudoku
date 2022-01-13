part of 'sudoku_bloc.dart';

abstract class SudokuEvent extends Equatable {
  const SudokuEvent();
}

class CellSelected extends SudokuEvent {
  final CellId cell;

  const CellSelected(this.cell);

  @override
  List<Object> get props => [cell];
}

class NumberSelected extends SudokuEvent {
  final int number;

  const NumberSelected(this.number);

  @override
  List<Object> get props => [number];
}

class CandidateSwitched extends SudokuEvent {
  @override
  List<Object> get props => [];
}

class CleanCell extends SudokuEvent {
  @override
  List<Object> get props => [];
}
