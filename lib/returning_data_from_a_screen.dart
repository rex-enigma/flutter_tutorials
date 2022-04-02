import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool isFavorited = false;

  void setOption(BuildContext context) async {
    //Navigator.push returns a Future that completes after calling Navigator.pop
    //on the selection screen
    //the value that the Future will complete with is the one that is passed to the
    //Navigator.pop(context, value) as the second argument.
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SelectionScreen()),
    );

    setState(() {
      isFavorited = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Returning data demo'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setOption(context);
                // _navigateAndDisplaySelectionScreen(context);
              },
              child: const Text('pick an option, any option!'),
            ),
            Icon(
              isFavorited ? Icons.star : Icons.star_border,
              color: Colors.red[500],
            ),
          ],
        ),
      ),
    );
  }
}

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick an option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  //close the screen and return 'yap' as the result
                  Navigator.pop<bool>(context, true);
                },
                child: const Text('make the HomeScreen star completely red'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  //close the screen and return 'Nope' as the result
                  Navigator.pop<bool>(context, false);
                },
                child: const Text('make the HomeScreen star border red '),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////////
//this one was a snackbar example. Showing true of false depending on which type of value returned
//by Navigator.pop(context,value).

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Returning data demo'),
//       ),
//       body: const Center(
//         child: SelectionButton(),
//       ),
//     );
//   }
// }

// class SelectionButton extends StatelessWidget {
//   const SelectionButton({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         _navigateAndDisplaySelectionScreen(context);
//       },
//       child: const Text('pick an option, any option!'),
//     );
//   }
// }

// void _navigateAndDisplaySelectionScreen(BuildContext context) async {
//   // Navigator.push returns a Future that completes after calling Navigator.pop
//   //on the selection screen
//   //the value that the Future will complete with is the one that is passed to the
//   //Navigator.pop(context, value) as the second argument.
//   final result = await Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => SelectionScreen()),
//   );

//   // After the Selection Screen returns a result, hide any previous snackbars
//   // and show the new result.
//   ScaffoldMessenger.of(context)
//     ..removeCurrentSnackBar()
//     ..showSnackBar(SnackBar(content: Text('$result')));
// }
