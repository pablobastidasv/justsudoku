import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

const defaultBoardSize = 9;

class BoardModel with ChangeNotifier {
  late final List<List<CellModel>> columns;
  CellModel? selected;
  bool candidateEnabled = false;

  BoardModel({int boardSize = defaultBoardSize}) {
    columns = List.generate(
      boardSize,
      (column) => List.generate(
        boardSize,
        (row) => CellModel(
          id: CellId(
            column,
            row,
          ),
        ),
        growable: false,
      ),
      growable: false,
    );
  }

  selectCell(CellId id) {
    for (var column in columns) {
      for (var cell in column) {
        if (cell.id == id) {
          cell.markSelected();
          selected = cell;
        } else {
          cell.markUnSelected();
        }
      }
    }
  }

  numberSelected(String number) {
    if (candidateEnabled) {
      selected?.defineCandidate(int.parse(number));
    } else {
      selected?.defineFixedValue(number);
    }
  }

  eraseCell(){
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
  String number;
  String candidates;
  bool selected;

  bool get isCandidate => number == '0';

  bool get isFixed => !isCandidate;

  CellModel({
    required this.id,
    this.isClue = false,
    this.candidates = "000000000",
    this.number = '0',
    this.selected = false,
  });

  defineCandidate(int value) {
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
}

class CellId extends Equatable {
  final int row;
  final int column;

  const CellId(this.column, this.row);

  @override
  List<Object> get props => [row, column];
}
