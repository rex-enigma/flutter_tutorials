import 'package:flutter/material.dart';
import 'package:layout_test/first_route.dart';
import 'package:layout_test/returning_data_from_a_screen.dart';
import 'package:layout_test/second_route.dart';
import 'package:layout_test/sending_data_to_a_new_screen.dart';
import 'package:layout_test/state_management.dart';

//we use Material app as the root because its provides a lot of default functionality including navigator that is used to manage a set of child widget with a stack discipline.
//used by firstRoute.dart and secondRoute.dart
//using named route
// void main() {
//   runApp(MaterialApp(
//     title: 'Flutter Layout demo',
//     initialRoute: '/',
//     routes: {
//       '/': (context) => FirstRoute(),
//       '/second': (context) => SecondRoute(),
//     },
//   ));
// }

// used by state_management.dart
// void main() {
//   runApp(MaterialApp(
//     title: 'Flutter Layout demo',
//     home: ParentWidget(),
//   ));
// }

// used by send sending_data_to_a_new_screen.dart
// void main() {
//   runApp(MaterialApp(
//     title: 'flutter sending data to the next screen demo',
//     home: TodosScreen(),
//   ));
// }

// used by returning_data_from_a_screen.dart
void main() {
  runApp(MaterialApp(
    title: 'flutter sending data to the next screen demo',
    home: const HomeScreen(),
  ));
}
