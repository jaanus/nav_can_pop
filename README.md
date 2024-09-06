# nav_can_pop

A small Flutter project to demonstrate a Flutter bug on iOS. Or rather, what seems to be several bugs interacting.

When you use `MediaQuery.platformBrightnessOf(context);` on Flutter with iOS, this causes an unwanted `build` call when you put the app to background. In that `build` call, `Navigator.canPop()` returns an incorrect value for the root view of the stack. If you use this value to determine whether to paint a custom Back button in AppBar, your UI will be incorrect, and have a back button where one is not expected.

Flutter bug filed: https://github.com/flutter/flutter/issues/154710

Demo video:

https://github.com/user-attachments/assets/83946c70-1c47-4587-bbf3-bffad4cf5e9d
