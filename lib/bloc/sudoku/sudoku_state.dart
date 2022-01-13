part of 'sudoku_bloc.dart';

abstract class SudokuState extends Equatable {
  const SudokuState();
}

class SudokuInitial extends SudokuState {
  @override
  List<Object> get props => [];
}

class SelectedCell extends SudokuState {
  final CellId id;

  const SelectedCell(this.id);

  @override
  List<Object> get props => [id];
}

class SelectedNumber extends SelectedCell {
  final int number;

  const SelectedNumber(this.number, CellId cellId) : super(cellId);

  @override
  List<Object> get props => [number, super.id];
}

class SwitchCandidate extends SudokuState {
  final bool candidate;

  const SwitchCandidate(this.candidate);

  @override
  List<Object> get props => [candidate];
}

class FixNumber extends SudokuState {
  final int number;

  const FixNumber(this.number);

  @override
  List<Object> get props => [number];
}

class CandidateNumber extends SudokuState {
  final int number;

  const CandidateNumber(this.number);

  @override
  List<Object> get props => [number];
}
