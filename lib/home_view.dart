import 'package:flutter/material.dart';
import 'package:nav_can_pop/child_view.dart';
import 'package:nav_can_pop/my_scaffold.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Home view"),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyScaffold(
                  title: "Child view",
                  child: ChildView(),
                ),
              ),
            );
          },
          child: const Text(
            "Navigate to child",
          ),
        ),
      ],
    );
  }
}
