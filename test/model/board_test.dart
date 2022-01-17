import 'package:flutter_test/flutter_test.dart';
import 'package:just_sudoku/model/board.dart';
import 'package:sudoku_solver_generator/sudoku_solver_generator.dart';

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

  test('given a defined number, candidates change', () {
    final cell = CellModel(
      id: const CellId(3, 5),
    );

    // With fixed value defined
    cell.defineFixedValue("3");
    cell.defineCandidate(4);
    expect('000400000', cell.candidates);
  });

  test(
    'when candidates are defined and a number is fixed, candidates get cleaned',
    () {
      final cell = CellModel(
        id: const CellId(3, 5),
      );

      cell.defineCandidate(3);
      cell.defineCandidate(8);
      cell.defineFixedValue('2');

      expect(cell.candidates, '000000000');
    },
  );

  test('given a fixed number twice, fixed number is 0', () {
    final cell = CellModel(
      id: const CellId(3, 5),
    );

    cell.defineFixedValue('1');
    cell.defineFixedValue('1');

    expect('0', cell.number);
  });

  test('selected cell is from same region, hightlighted is true', () {
    final cell = CellModel(
      id: const CellId(3, 5),
    );
    final selected = CellModel(
      id: const CellId(5, 3),
    );

    cell.mark(selected);

    expect(true, cell.highlighted);
    expect(false, cell.selected);
  });

  test('nothing', () {
    var sudokuGenerator = SudokuGenerator(emptySquares: 54);
    SudokuUtilities.printSudoku(sudokuGenerator.newSudoku);
    print(''); // ignore: avoid_print
    SudokuUtilities.printSudoku(sudokuGenerator.newSudokuSolved);
  });
}
