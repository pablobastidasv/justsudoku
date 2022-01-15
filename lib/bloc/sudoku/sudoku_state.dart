part of 'sudoku_bloc.dart';

abstract class SudokuState extends Equatable {
  const SudokuState();
}

class SudokuInitial extends SudokuState {
  @override
  List<Object> get props => [];
}

abstract class CellInfo extends SudokuState {
  final CellId id;

  const CellInfo(this.id);

  @override
  List<Object> get props => [id];
}

class SelectedCellState extends CellInfo {

  const SelectedCellState(CellId id) : super(id);

  @override
  List<Object> get props => [id];
}

class SelectedNumberState extends CellInfo {
  final Cell cell;

  const SelectedNumberState(CellId cellId, this.cell)
      : super(cellId);

  @override
  List<Object> get props => [cell, id];
}

class SwitchCandidateState extends SudokuState {
  final bool candidate;

  const SwitchCandidateState(this.candidate);

  @override
  List<Object> get props => [candidate];
}
