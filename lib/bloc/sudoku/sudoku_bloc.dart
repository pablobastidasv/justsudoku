import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_sudoku/model/board.dart';

part 'sudoku_event.dart';

part 'sudoku_state.dart';

class SudokuBloc extends Bloc<SudokuEvent, SudokuState> {
  CellId? selectedCell;
  int? selectedNumber;
  bool candidate = false;
  Board board = Board();

  SudokuBloc() : super(SudokuInitial()) {
    on<CellSelectedEvent>(_cellSelected);
    on<NumberSelectedEvent>(_numberSelected);
    on<CandidateSwitchedEvent>(_candidateSwitched);
    on<CleanCellEvent>(_cleanSelectedCell);
  }

  _cellSelected(CellSelectedEvent event, Emitter<SudokuState> emit) {
    selectedCell = event.cell;
    emit(SelectedCellState(event.cell));
  }

  _numberSelected(NumberSelectedEvent event, Emitter<SudokuState> emit) {
    selectedNumber = event.number;
    if (_isCellSelected()) {
      var cell = _updateCell();

      emit(SelectedNumberState(
        selectedCell!,
        cell,
      ));
    }
  }

  Cell _updateCell() {
    var actualCell = board.columns[selectedCell!.column][selectedCell!.row];
    var actualCandidates = actualCell.candidates;

    if (candidate && _isNumberSelected()) {
      actualCandidates.update(selectedNumber!);
    }

    var cell = actualCell.copyWith(
      number: selectedNumber,
      candidate: candidate,
      candidates: actualCandidates,
    );
    board.columns[selectedCell!.column][selectedCell!.row] = cell;
    return cell;
  }

  _candidateSwitched(CandidateSwitchedEvent event, Emitter<SudokuState> emit) {
    candidate = !candidate;
    emit(SwitchCandidateState(candidate));
  }

  _cleanSelectedCell(CleanCellEvent event, Emitter<SudokuState> emit) {
    selectedNumber = 0;
    candidate = false;
    if (_isCellSelected() && _isNumberSelected()) {
      var cell = _updateCell();

      emit(SelectedNumberState(
        selectedCell!,
        cell,
      ));
    }
  }

  _isCellSelected() => selectedCell != null;

  _isNumberSelected() => selectedNumber != null;
}
