import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // This media query is causing unwanted “build” call when putting the app to background on iOS
    final brightness = MediaQuery.platformBrightnessOf(context);
    final navigator = Navigator.maybeOf(context);
    final String? canPop;
    if (navigator != null) {
      canPop = navigator.canPop() ? "true" : "false";
    } else {
      canPop = "(navigator not found)";
    }

    String impliesAppBarDismissal = "(n/a)";

    // Simply uncommenting the following part of code will change the app behavior to be correct.
    // build() is called more frequently and Navigator.canPop() will report correct values.
    // final route = ModalRoute.of(context);
    // if (route != null) {
    //   impliesAppBarDismissal = route.impliesAppBarDismissal ? "true" : "false";
    // } else {
    //   impliesAppBarDismissal = "(route not found)";
    // }

    // canPop should be false for HomeView and true for ChildView
    // in the rogue build call when putting app to background for iOS,
    // canPop is reported as true for both HomeView and ChildView.

    debugPrint(
      "MyScaffold build. Brightness: $brightness. Child type: ${child.runtimeType.toString()}. Navigator canPop: $canPop. ModalRoute impliesAppBarDismissal: $impliesAppBarDismissal",
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: canPop == "true" ? _BackButton() : null,
      ),
      body: child,
    );
  }
}

class _BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
