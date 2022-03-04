import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Image.asset('images/pic1.jpg')),
              Expanded(
                flex: 2,
                child: Image.asset('images/pic2.jpg'),
              ),
              Expanded(child: Image.asset('images/pic3.jpg')),
            ],
          ),
        ),
      ),
    );
  }
}
