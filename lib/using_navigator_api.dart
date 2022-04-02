import 'package:flutter/material.dart';

//this widget uses Navigator.push or Navigator.pushNamed to navigate to the next route(SecondRoute)

class FirstRoute extends StatelessWidget {
  FirstRoute({Key? key}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Basics'),
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
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => (const SecondRoute())));
              // Navigator.pushNamed(context, '/second',
              //     arguments: ScreenArguments('settings for second route',
              //         'this message is extracted in the build method'));
            },
            child: const Text('Go to the second Route'),
          ),
        ],
      ),
    );
  }
}

//passing ScreenArguments as argument parameter to the Navigator.pushNamed static function
class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
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

/////////////////////////////////////////
//this widget uses Navigator.pop to navigate the previous route(FirstRoute)

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Extract arguments from the current ModalRoute
    //settings 'property' and cast then as ScreenArguments
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(args.title),
            Text(args.message),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}
