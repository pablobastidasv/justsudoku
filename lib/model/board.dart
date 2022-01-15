import 'package:equatable/equatable.dart';

const defaultBoardSize = 9;

class Board {
  late final List<List<Cell>> columns;

  Board({int boardSize = defaultBoardSize}) {
    columns = List.generate(
      boardSize,
      (column) => List.generate(
        boardSize,
        (row) => Cell(column, row),
        growable: false,
      ),
      growable: false,
    );
  }
}

class Cell extends Equatable {
  late final CellId id;
  final int number;
  late final Candidates candidates;
  final bool candidate;

  Cell(
    int column,
    int row, {
    this.number = 0,
    this.candidate = false,
    Candidates? candidates,
  }) {
    id = CellId(column, row);
    this.candidates = candidates ?? Candidates();
  }

  copyWith({
    int? number,
    Candidates? candidates,
    bool? candidate,
  }) {
    return Cell(
      id.column,
      id.row,
      number: number ?? this.number,
      candidates: candidates ?? this.candidates,
      candidate: candidate ?? this.candidate,
    );
  }

  @override
  List<Object> get props => [number, candidates, candidate];
}

class Candidates {
  List<String> _candidates = List.filled(defaultBoardSize, '0');

  Candidates();

  factory Candidates.from(String number) {
    final candidates = Candidates();
    candidates._candidates = number.split('');
    return candidates;
  }

  update(int number) {
    assert(number > 0 && number <= defaultBoardSize);

    _candidates[number - 1] == '0'
        ? _candidates[number - 1] = '$number'
        : _candidates[number - 1] = '0';
  }

  @override
  String toString() {
    return _candidates.join();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Candidates &&
          runtimeType == other.runtimeType &&
          _candidates == other._candidates;

  @override
  int get hashCode => _candidates.hashCode;
}

class CellId extends Equatable {
  final int row;
  final int column;

  const CellId(this.column, this.row);

  @override
  List<Object> get props => [row, column];
}
