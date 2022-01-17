import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sudoku_solver_generator/sudoku_solver_generator.dart';

const defaultBoardSize = 9;

class BoardModel with ChangeNotifier {
  late final List<List<CellModel>> columns;
  CellModel? selected;
  bool candidateEnabled = false;

  BoardModel({
    int boardSize = defaultBoardSize,
    required int level,
  }) {
    final generator = SudokuGenerator(emptySquares: level);
    final values = generator.newSudoku;
    final solved = generator.newSudokuSolved;

    columns = [
      for (var column = 0; column < values.length; column++)
        [
          for (var row = 0; row < values[column].length; row++)
            CellModel(
              id: CellId(column, row),
              number: '${values[column][row]}',
              solution: '${solved[column][row]}',
              isClue: values[column][row] != 0,
            )
        ]
    ];
  }

  selectCell(CellId id) {
    for (var column in columns) {
      for (var cell in column) {
        cell.mark(id);
        if (cell.id == id) {
          selected = cell;
        }
      }
    }
  }

  numberSelected(String number) {
    if (candidateEnabled) {
      selected?.defineCandidate(int.parse(number));
    } else {
      selected?.defineFixedValue(number);
      candidateEnabled = true;
      notifyListeners();
    }
  }

  eraseCell() {
    selected?.defineFixedValue('0');
  }

  switchCandidate() {
    candidateEnabled = !candidateEnabled;
    notifyListeners();
  }
}

class CellModel with ChangeNotifier {
  final CellId id;
  final bool isClue;
  final String solution;

  String number;
  String candidates;
  bool selected;
  bool highlighted;

  bool get isCandidate => number == '0';

  bool get isFixed => !isCandidate;

  CellModel({
    required this.id,
    this.isClue = false,
    this.candidates = "000000000",
    this.number = '0',
    this.solution = '0',
    this.selected = false,
    this.highlighted = false,
  });

  defineCandidate(int value) {
    if (isClue) return;
    if (isFixed) number = '0';

    final index = value - 1;
    final actual = candidates[index];
    final replaceValue = actual == '0' ? '$value' : '0';

    candidates = candidates.replaceRange(index, index + 1, replaceValue);

    notifyListeners();
  }

  switchSelectedState() {
    selected = !selected;
    notifyListeners();
  }

  defineFixedValue(String value) {
    if (isClue) return;
    candidates = "000000000";
    number = number == value ? '0' : value;
    notifyListeners();
  }

  void markSelected() {
    selected = true;
    notifyListeners();
  }

  void markUnSelected() {
    selected = false;
    notifyListeners();
  }

  mark(CellId selected) {
    this.selected = false;
    highlighted = false;

    if (selected == id) {
      this.selected = true;
    } else if (isRelated(selected)) {
      highlighted = true;
    }

    notifyListeners();
  }

  bool isRelated(CellId selected) {
    return isSameRow(selected) ||
        isSameColumn(selected) ||
        isSameRegion(selected);
  }

  bool isSameRow(CellId selected) {
    return id.row == selected.row;
  }

  bool isSameColumn(CellId selected) {
    return id.column == selected.column;
  }

  bool isSameRegion(CellId selected) {
    return id.region == selected.region;
  }
}

class CellId extends Equatable {
  final int row;
  final int column;

  get region {
    var regionSize = defaultBoardSize / 3;
    var x = column ~/ regionSize;
    var y = row ~/ regionSize;

    return Pair(x, y);
  }

  const CellId(this.column, this.row);

  @override
  List<Object> get props => [row, column];
}

class Pair extends Equatable {
  final int x, y;

  const Pair(this.x, this.y);

  @override
  List<Object> get props => [x, y];
}
