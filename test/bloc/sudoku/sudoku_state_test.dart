import 'package:flutter_test/flutter_test.dart';
import 'package:just_sudoku/bloc/sudoku/sudoku_bloc.dart';
import 'package:just_sudoku/model/board.dart';

void main () {

  test('when SelectedNumberState change state, it is different', () {
    var id = const CellId(5, 3);
    var cell = Cell(5, 3);

    cell.candidates.update(4);
    var newCell = Cell(5, 3, candidate:  true, candidates: cell.candidates);

    final selectedNumberState = SelectedNumberState(id, cell);
    final selectedNumberNewState = SelectedNumberState(id, newCell);

    expect(false, selectedNumberState == selectedNumberNewState);
  });
}