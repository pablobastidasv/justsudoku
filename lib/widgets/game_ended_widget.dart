import 'package:flutter/material.dart';
import 'package:just_sudoku/model/board.dart';
import 'package:just_sudoku/pages/hello_page.dart';
import 'package:just_sudoku/widgets/all_confetti_widget.dart';
import 'package:provider/provider.dart';

import 'blurrier_panel_widget.dart';

class GameEndedWidget extends StatelessWidget {
  const GameEndedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final bool solved = context.select<BoardModel, bool>((model) => model.solved);

    return Visibility(
      visible: solved,
      child: SizedBox.expand(
        child: AllConfetti(
          child: Stack(
            children: const [
              BlurrierPanelWidget(),
              Center(
                child: _GameEndedCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GameEndedCard extends StatelessWidget {
  const _GameEndedCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      height: 300,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            _CongratsText(),
            _NewMatchButton(),
          ],
        ),
        elevation: 20,
      ),
    );
  }
}

class _CongratsText extends StatelessWidget {
  const _CongratsText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Excelente 🎉🎉!',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32,
      ),
    );
  }
}

class _NewMatchButton extends StatelessWidget {
  const _NewMatchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HelloPage(),
            ),
          );
        },
        child: const Text(
          "Nueva Partida...",
          style: TextStyle(fontSize: 24),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50), // NEW
        ),
      ),
    );
  }
}


