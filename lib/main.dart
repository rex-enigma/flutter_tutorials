import 'package:flutter/material.dart';

void main() {
  runApp(ParentWidget());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'kandersteg Switzerland',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        FavoriteWidget(),
      ],
    ),
  );

  Column _buildButtonColumn({required Color color, required IconData icon, required String label}) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  late Widget buttonSection = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildButtonColumn(color: Colors.blue, icon: Icons.call, label: 'CALL'),
      _buildButtonColumn(color: Colors.blue, icon: Icons.near_me, label: 'ROUTE'),
      _buildButtonColumn(color: Colors.blue, icon: Icons.share, label: 'SHARE'),
    ],
  );

  Widget textSection = const Padding(
    padding: EdgeInsets.all(32.0),
    child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    print(context is Element);
    return MaterialApp(
      title: 'Flutter Layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Layout demo'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  FavoriteWidget({Key? key}) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      _isFavorited ? _favoriteCount = _favoriteCount - 1 : _favoriteCount = _favoriteCount + 1;
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////
// a mix and match approach of managing state.
// 1:parent managing the widget's state. In this case the 'active'
// 2:widget managing its own state. In this case 'highlight'

class ParentWidget extends StatefulWidget {
  ParentWidget({Key? key}) : super(key: key);

  @override
  createState() => (ParentWidgetState());
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
        body: TapBoxC(
          active: isActive,
          onChange: handleTapBoxChange,
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
