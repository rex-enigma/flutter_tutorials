import 'package:flutter/material.dart';
import 'package:layout_test/using_navigator_api.dart';
import 'package:layout_test/returning_data_from_a_screen.dart';
import 'package:layout_test/sending_data_to_a_new_screen.dart';
import 'package:layout_test/state_management.dart';

//passing argument to the next screen can only be used by named route

//we use Material app as the root because its provides a lot of default functionality including navigator that is used to manage a set of child widget with a stack discipline.
//used by using_navigator_api.dart.
//using named route(Navigator.pushNamed()) to navigate to the next route(SecondRoute).
//also ModalRoute.of(context) is used to pass argument to the named route.
//comment Navigator.push()in FirstRoute class to test the named route.
//uncomment Navigator.pushNamed() in FirstRoute class to test navigation
//uncomment ModalRoute.of(Context) and child widgets that uses it in SecondRoute class to test navigation

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

//used by using.navigator_api.dart.
//using Navigator.push().
//comment Navigator.pushNamed() in FirstRoute class to test navigation
//comment ModalRoute.of(Context) and child widgets that uses it in SecondRoute class to test navigation

// void main() {
//   runApp(MaterialApp(
//     title: 'Flutter Layout demo',
//     home: FirstRoute(),
//   ));
// }

// used by state_management.dart

// void main() {
//   runApp(MaterialApp(
//     title: 'Flutter Layout demo',
//     home: ParentWidget(),
//   ));
// }

// used by sending_data_to_a_new_screen.dart

// void main() {
//   runApp(MaterialApp(
//     title: 'flutter sending data to the next screen demo',
//     home: TodosScreen(),
//   ));
// }

// // used by returning_data_from_a_screen.dart

void main() {
  runApp(MaterialApp(
    title: 'flutter sending data to the next screen demo',
    home: const HomeScreen(),
  ));
}
