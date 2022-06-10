import 'package:flutter/material.dart';

// 1: parent managing the widget's state. In this case the 'active'
// 2: widget managing its own state. In this case 'highlight'
// 3: a mix and match approach of managing state.

class ParentWidget extends StatefulWidget {
  ParentWidget({Key? key}) : super(key: key);

  @override
  createState() => ParentWidgetState();
}

class ParentWidgetState extends State<ParentWidget> {
  bool isActive = false;

  void handleTapBoxChange() {
    setState(() {
      isActive = !isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Mix & Match State Management Approach')),
        body: Column(
          children: [
            TapBoxC(
              active: isActive,
              onChange: handleTapBoxChange,
            ),
          ],
        ),
      ),
    );
  }
}

class TapBoxC extends StatefulWidget {
  TapBoxC({required this.active, required this.onChange});

  bool active;
  VoidCallback onChange;

  @override
  TapBoxCState createState() => TapBoxCState();
}

class TapBoxCState extends State<TapBoxC> {
  bool isHighlighted = false;

  void handleTapDown(TapDownDetails details) {
    setState(() {
      isHighlighted = !isHighlighted;
    });
  }

  void handleTapUp(TapUpDetails details) {
    setState(() {
      isHighlighted = !isHighlighted;
    });
  }

  void handleTap() {
    widget.onChange();
  }

  void handleCancel() {
    setState(() {
      isHighlighted = !isHighlighted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: handleTapDown,
      onTapUp: handleTapUp,
      onTap: handleTap,
      onTapCancel: handleCancel,
      child: Container(
        width: 200.0,
        height: 200.0,
        child: Center(
          child: Text(
            widget.active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: isHighlighted
              ? Border.all(
                  color: Colors.teal[700]!,
                  width: 10.0,
                )
              : null,
        ),
      ),
    );
  }
}
