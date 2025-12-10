1. Native vs Cross-Platform Development

Native development means building apps separately for each platform (Android → Java/Kotlin, iOS → Swift/Objective-C).

Cross-platform development (Flutter) allows using one codebase to build apps for Android, iOS, Web, and Desktop.

Flutter reduces development time because I don’t have to write separate UI code for multiple platforms.

2. Hot Reload

Hot Reload is one of Flutter’s best features.

It allows me to see UI changes instantly without restarting the whole app.

This makes debugging and UI design much faster.

3. Widgets

Flutter apps are built completely using widgets.

Everything in Flutter is a widget → Text, Row, Column, Image, Button, Scaffold, etc.

Widgets can be:

Stateless Widgets: UI does not change

Stateful Widgets: UI updates when state changes

This helps create clean and reusable UI components.

4. Install Flutter

1. Download Flutter from https://flutter.dev

Extract it and add Flutter to your system PATH.

2. Check Installation
flutter doctor

3. Get Project Dependencies
flutter pub get

4. Run the App
flutter run

Even/Odd Checker Feature
JIT vs AOT (Short Summary)

JIT (Just-In-Time): Runs during development. It allows Hot Reload, which makes coding faster.

AOT (Ahead-Of-Time): Used when building the release APK. It makes the app faster and more optimized.

Dart Conditionals Used in the App

I used a simple if-else conditional to check the number:

if (num % 2 == 0) {
  result = "$num is Even";
} else {
  result = "$num is Odd";
}

String Interpolation

String interpolation was used to show the final result inside a sentence:

result = "$num is Even";


Here, $num automatically places the number inside the string.