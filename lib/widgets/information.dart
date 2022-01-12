import 'package:flutter/material.dart';

class InformationWidget extends StatelessWidget {
  const InformationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [Text('Hard'), Text('Mistakes: 0/3'), Text('24:23')],
    );
  }
}