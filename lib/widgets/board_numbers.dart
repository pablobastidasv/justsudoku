import 'package:flutter/material.dart';

class NumbersWidget extends StatelessWidget {
  const NumbersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _widgets(),
      ),
    );
  }

  _widgets() {
    return [for (var i = 1; i < 10; i += 1) NumberWidget(number: i)];
  }
}

class NumberWidget extends StatelessWidget {
  final int number;

  const NumberWidget({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$number',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 48,
      ),
    );
  }
}