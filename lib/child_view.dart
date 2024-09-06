import 'package:flutter/material.dart';

class ChildView extends StatelessWidget {
  const ChildView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("Child view"),
      ],
    );
  }
}
