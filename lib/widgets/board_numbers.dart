import 'dart:math';

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

class NumberWidget extends StatefulWidget {
  final int number;

  const NumberWidget({Key? key, required this.number}) : super(key: key);

  @override
  State<NumberWidget> createState() => _NumberWidgetState();
}

final rng = Random();

class _NumberWidgetState extends State<NumberWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        '${widget.number}',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 48,
        ),
      ),
    );
  }
}
