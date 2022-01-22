import 'package:flutter_test/flutter_test.dart';

void main(){
  test('double for give correct indexed', () {
    for(var col = 0; col < 9; col+=3) {
      for(var row = 0; row < 3; row++){
        print('${col+row}');
      }
    }
  });
}