
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_sudoku/model/board.dart';

part 'sudoku_event.dart';
part 'sudoku_state.dart';

class SudokuBloc extends Bloc<SudokuEvent, SudokuState> {
  CellId? selectedCell;
  int? selectedNumber;
  bool candidate = false;

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
    if (_isCellSelected()) emit(SelectedNumberState(event.number, selectedCell!));
  }

  _candidateSwitched(CandidateSwitchedEvent event, Emitter<SudokuState> emit) {
    candidate = !candidate;
    emit(SwitchCandidateState(candidate));
  }

  _cleanSelectedCell(CleanCellEvent event, Emitter<SudokuState> emit) {
    selectedNumber = 0;
    if (_isCellSelected() && _isNumberSelected()) {
      emit(SelectedNumberState(selectedNumber!, selectedCell!));
    }
  }

  _isCellSelected() => selectedCell != null;

  _isNumberSelected() => selectedNumber != null;
}
