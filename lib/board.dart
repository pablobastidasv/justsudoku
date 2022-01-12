import 'package:flutter/material.dart';

class BoardWidget extends StatelessWidget {
  const BoardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: const [
            RegionRow(),
            RegionRow(),
            RegionRow(),
          ],
        ),
      ],
    );
  }
}

class RegionRow extends StatelessWidget {
  const RegionRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        RegionWidget(),
        RegionWidget(),
        RegionWidget(),
      ],
    );
  }
}

class RegionWidget extends StatelessWidget {
  const RegionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Column(
        children: [
          Row(children: [board[0][1], board[0][2], board[0][3]]),
          Row(children: [board[0][1], board[0][2], board[0][3]]),
          Row(children: [board[0][1], board[0][2], board[0][3]]),
        ],
      ),
    );
  }
}

class CellWidget extends StatelessWidget {
  const CellWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const size = 80.0;
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(border: Border.all(width: 0.1)),
      child: const NumberedCell(),
    );
  }
}

class NumberedCell extends StatelessWidget {
  const NumberedCell({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '9',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 48),
      ),
    );
  }
}

class CandidatesWidget extends StatelessWidget {
  const CandidatesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            CandidateNumberWidget(number: 1),
            CandidateNumberWidget(number: 2),
            CandidateNumberWidget(number: 3),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            CandidateNumberWidget(number: 4),
            CandidateNumberWidget(number: 5),
            CandidateNumberWidget(number: 6),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            CandidateNumberWidget(number: 7),
            CandidateNumberWidget(number: 8),
            CandidateNumberWidget(number: 9),
          ],
        ),
      ],
    );
  }
}

class CandidateNumberWidget extends StatelessWidget {
  final int number;

  const CandidateNumberWidget({Key? key, required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$number',
      style: const TextStyle(color: Colors.grey, fontSize: 21),
    );
  }
}

const board = [
  [
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget()
  ],
  [
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget()
  ],
  [
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget()
  ],
  [
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget()
  ],
  [
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget()
  ],
  [
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget()
  ],
  [
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget()
  ],
  [
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget()
  ],
  [
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget(),
    CellWidget()
  ],
];