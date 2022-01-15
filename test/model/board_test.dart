import 'package:flutter_test/flutter_test.dart';
import 'package:just_sudoku/model/board.dart';

void main() {
  test('update a candidate', () {
    var candidates = Candidates();

    candidates.update(3);

    expect(candidates.toString(), '003000000');
  });

  test('removing a candidate', () {
    var candidates = Candidates();

    candidates.update(3);
    candidates.update(3);

    expect(candidates.toString(), '000000000');
  });
}