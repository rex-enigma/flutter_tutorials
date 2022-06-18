import 'package:flutter/material.dart';
import 'package:layout_test/navigating_to_a_new_screen/navigator_unnamed_route.dart';
import 'package:layout_test/navigating_to_a_new_screen/navigator_named_route.dart';
import 'package:layout_test/returning_data_from_a_screen.dart';
import 'package:layout_test/sending_data_to_a_new_screen/sending_data_to_a_new_screen_using_argument_property_(_pushNamed_api_used_).dart';
import 'package:layout_test/sending_data_to_a_new_screen/sending_data_to_a_new_screen_using_new_screen_constructor_(_push_api_used_).dart';
import 'package:layout_test/sending_data_to_a_new_screen/sending_data_to_a_new_screen_using_RouteSettings_(_push_api_used_).dart';
import 'package:layout_test/sending_data_to_a_new_screen/sending_data_to_a_new_screen_using_onGenerateRoute_api_(_pushNamed_api_used_).dart';
import 'package:layout_test/state_management.dart';
import 'package:layout_test/animate_a_widget_across_screen.dart';

//we use Material app as the root because its provides a lot of default functionality including navigator that is used to manage a set of child widget with a stack discipline.

//used by navigator_named_route.dart
//using named route(Navigator.pushNamed()) to navigate to the next route(SecondRoute).

// void main() {
//   runApp(MaterialApp(
//     title: 'Flutter Layout demo && navigator demo',
//     initialRoute: First_Route.routeName,
//     routes: {
//       First_Route.routeName: (context) => First_Route(),
//       Second_Route.routeName: (context) => Second_Route(),
//     },
//   ));
// }

//used by navigator_unnamed_route.dart.
//using Navigator.push().

// void main() {
//   runApp(MaterialApp(
//     title: 'navigating using unnamed route',
//     home: FirstRoute(),
//   ));
// }

// used by state_management.dart

// void main() {
//   runApp(MaterialApp(
//     title: 'state management demo',
//     home: ParentWidget(),
//   ));
// }

// sending_data_to_a_new_screen_using_new_screen_constructor_(_push_api_used_).dart
// using Navigator.push()

// void main() {
//   runApp(MaterialApp(
//     title: 'sending data to the next screen constructor demo',
//     home: TodosScreenA(),
//   ));
// }

// sending_data_to_a_new_screen_using_RouteSettings_(_push_api_used_).dart
// passing arguments to a unnamed route via a RouteSetting

// void main() {
//   runApp(MaterialApp(
//     title: 'sending data to the next screen demo(using RouteSettings)',
//     home: TodosScreenB(),
//   ));
// }

// used by sending_data_to_a_new_screen_using_argument_property_( pushNamed api used ).dart
// passing arguments to a named route

// void main() {
//   runApp(MaterialApp(
//     title: 'sending data to the next screen demo(using arguments property)',
//     initialRoute: TodosScreenC.routeName,
//     routes: {
//       TodosScreenC.routeName: (context) => TodosScreenC(),
//       DetailTodoScreenA.routeName: (context) => DetailTodoScreenA(),
//     },
//   ));
// }

// used by sending_data_to_a_new_screen_using_onGenerateRoute_api_(_pushNamed_api_used_).dart
// passing arguments to a named route

void main() {
  runApp(
    MaterialApp(
      title: 'sending data to the next screen using onGenerateRoute demo',
      initialRoute: TodosScreenD.routeName,
      // Provide a function to handle named routes.
      // Use this function to identify the named
      // route being pushed, and create the correct
      // Screen.
      onGenerateRoute: (settings) {
        if (settings.name == TodosScreenD.routeName) {
          return MaterialPageRoute(
            builder: (context) => TodosScreenD(),
          );
        }
        // If you push the DetailTodoScreenA
        if (settings.name == DetailTodoScreenA.routeName) {
          //cast the argument to the correct
          //type: TodoA
          final args = settings.arguments as TodoA;
          // Then extract the correct data from the argument
          // and pass the data to the correct screen.
          return MaterialPageRoute(
              builder: (context) => DetailTodoScreenB(
                    title: args.title,
                    description: args.description,
                  ));
        }
      },
    ),
  );
}

// used by returning_data_from_a_screen.dart

// void main() {
//   runApp(MaterialApp(
//     title: 'flutter sending data to the next screen demo',
//     home: const HomeScreen(),
//   ));
// }

// used by animate_a_widget_across_screen.dart

// void main(List<String> args) {
//   runApp(MaterialApp(
//     title: 'animating a widget across screen',
//     home: MainScreen(),
//   ));
// }
