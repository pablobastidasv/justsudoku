part of 'sudoku_bloc.dart';

abstract class SudokuState extends Equatable {
  const SudokuState();
}

class SudokuInitial extends SudokuState {
  @override
  List<Object> get props => [];
}

class SelectedCellState extends SudokuState {
  final CellId id;

  const SelectedCellState(this.id);

  @override
  List<Object> get props => [id];
}

class SelectedNumberState extends SelectedCellState {
  final int number;

  const SelectedNumberState(this.number, CellId cellId) : super(cellId);

  @override
  List<Object> get props => [number, super.id];
}

class SwitchCandidateState extends SudokuState {
  final bool candidate;

  const SwitchCandidateState(this.candidate);

  @override
  List<Object> get props => [candidate];
}
