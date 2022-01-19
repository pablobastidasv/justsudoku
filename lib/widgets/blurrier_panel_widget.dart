import 'package:flutter/material.dart';

class BlurrierPanelWidget extends StatelessWidget {
  const BlurrierPanelWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xC9FDFDFD), // TODO: Transparent Whit
      ),
    );
  }
}
