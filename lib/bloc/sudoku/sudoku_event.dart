part of 'sudoku_bloc.dart';

abstract class SudokuEvent extends Equatable {
  const SudokuEvent();
}

class CellSelectedEvent extends SudokuEvent {
  final CellId cell;

  const CellSelectedEvent(this.cell);

  @override
  List<Object> get props => [cell];
}

class NumberSelectedEvent extends SudokuEvent {
  final int number;

  const NumberSelectedEvent(this.number);

  @override
  List<Object> get props => [number];
}

class CandidateSwitchedEvent extends SudokuEvent {
  @override
  List<Object> get props => [];
}

class CleanCellEvent extends SudokuEvent {
  @override
  List<Object> get props => [];
}
