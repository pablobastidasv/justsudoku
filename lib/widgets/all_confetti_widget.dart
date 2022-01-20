import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class AllConfetti extends StatefulWidget {
  final Widget child;

  const AllConfetti({Key? key, required this.child}) : super(key: key);

  @override
  _AllConfettiState createState() => _AllConfettiState();
}

class _AllConfettiState extends State<AllConfetti> {
  late ConfettiController controller;

  @override
  void initState() {
    super.initState();

    controller = ConfettiController(duration: const Duration(seconds: 1));
    controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: controller,
            colors: const [
              Colors.red,
              Colors.blue,
              Colors.orange,
              Colors.purple,
              Colors.lightBlue,
            ],
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: true,
            emissionFrequency: 0.015,
            numberOfParticles: 30,
          ),
        ),
      ],
    );
  }
}
