import 'package:flutter_test/flutter_test.dart';
import 'package:just_sudoku/model/board.dart';

void main() {

  test('defining candidate in cell change the candidates string', () {
    final cell = CellModel(
      id: const CellId(3, 5),
    );

    cell.defineCandidate(4);

    expect('000400000', cell.candidates);

    // Going back to 0
    cell.defineCandidate(4);

    expect('000000000', cell.candidates);
  });

  test('given a defined number, candidates do not change', (){
    final cell = CellModel(
      id: const CellId(3, 5),
    );

    // With fixed value defined
    cell.defineFixedValue("3");
    cell.defineCandidate(4);
    expect('000000000', cell.candidates);

    // When fixed is not defined
    cell.defineFixedValue('3');
    cell.defineCandidate(4);
    expect('000400000', cell.candidates);
  });

  test('given a fixed number twice, fixed number is 0', () {
    final cell = CellModel(
      id: const CellId(3, 5),
    );

    cell.defineFixedValue('1');
    cell.defineFixedValue('1');

    expect('0', cell.number);
  });
}
