
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
    on<CellSelected>(_cellSelected);
    on<NumberSelected>(_numberSelected);
    on<CandidateSwitched>(_candidateSwitched);
    on<CleanCell>(_cleanSelectedCell);
  }

  _cellSelected(CellSelected event, Emitter<SudokuState> emit) {
    selectedCell = event.cell;
    emit(SelectedCell(event.cell));
  }

  _numberSelected(NumberSelected event, Emitter<SudokuState> emit) {
    selectedNumber = event.number;
    if (_isCellSelected()) emit(SelectedNumber(event.number, selectedCell!));
  }

  _candidateSwitched(CandidateSwitched event, Emitter<SudokuState> emit) {
    candidate = !candidate;
    emit(SwitchCandidate(candidate));
  }

  _cleanSelectedCell(CleanCell event, Emitter<SudokuState> emit) {
    selectedNumber = 0;
    if (_isCellSelected() && _isNumberSelected()) {
      emit(SelectedNumber(selectedNumber!, selectedCell!));
    }
  }

  _isCellSelected() => selectedCell != null;

  _isNumberSelected() => selectedNumber != null;
}
