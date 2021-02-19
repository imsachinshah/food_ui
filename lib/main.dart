import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter UI Kit",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int photoIndex = 0;

  List photos = [
    'assets/images/burger1.jpg',
    'assets/images/burger2.jpg',
    'assets/images/burger3.jpg',
    'assets/images/burger4.jpg',
  ];

  void _previousImage() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
    });
  }

  void _nextImage() {
    setState(() {
      photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : photoIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(shrinkWrap: true, children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(photos[photoIndex]),
                      fit: BoxFit.fitWidth)),
              height: 210,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.favorite),
                  color: Colors.pink,
                  onPressed: () {},
                )
              ],
            ),
            GestureDetector(
              child: Container(
                height: 210,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              onTap: _nextImage,
            ),
            GestureDetector(
              child: Container(
                height: 210,
                width: MediaQuery.of(context).size.width / 2,
                color: Colors.transparent,
              ),
              onTap: _previousImage,
            ),
            Positioned(
              left: 5.0,
              top: 180.0,
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 2.0,
                  ),
                  Text(
                    '4.0',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  SelectedPhoto(
                      numberOfDots: photos.length, photoIndex: photoIndex),
                ],
              ),
            ),
          ]),
          SizedBox(height: 30.0),
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'OPEN NOW UNTILL 7PM',
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Monserrat',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'The Cinnamon Snail',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontFamily: 'Monserrat',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '17th st & Union Sq East',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontFamily: 'Monserrat',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      Icons.location_on,
                      color: Colors.grey,
                      size: 16,
                    ),
                    Text(
                      '400ft Away',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.wifi_outlined,
                      color: Colors.green,
                      size: 16,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Location confirmed by 3 users today',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.green,
                          fontFamily: 'Monserrat',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 50),
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Text(
                  'FEATUED ITEMS',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontFamily: 'Monserrat',
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          _buildListItems(photos[0]),
          SizedBox(
            height: 15,
          ),
          _buildListItems(photos[1]),
          SizedBox(
            height: 15,
          ),
          _buildListItems(photos[2]),
          SizedBox(
            height: 15,
          ),
          _buildListItems(photos[3]),
        ],
      ),
    ]));
  }

  // List name = [
  //   'Maple Mustard Tempeh',
  //   'Maple Mustard Tempeh 2',
  //   'Maple Mustard Tempeh 3',
  //   'Maple Mustard Tempeh 4'
  // ];

  Widget _buildListItems(String picture) {
    return ListView(
      shrinkWrap: true,
      children: [
        Row(
          children: [
            Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(picture), fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10.0))),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Maple Mustard Tempeh',
                    style: TextStyle(
                        fontFamily: 'Monserrat',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Marinated kale, onion, tomato and roasted',
                    style: TextStyle(
                        fontSize: 13.0,
                        fontFamily: 'Montserrat',
                        // fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  Text(
                    'garlic aioli on grilled spelt bread',
                    style: TextStyle(
                        fontSize: 13.0,
                        fontFamily: 'Montserrat',
                        // fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$11.25',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

class SelectedPhoto extends StatelessWidget {
  final int numberOfDots;
  final int photoIndex;

  SelectedPhoto({this.numberOfDots, this.photoIndex});

  Widget _inactivePhoto() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: 6.0,
          width: 6.0,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(2.0)),
        ),
      ),
    );
  }

  Widget _activePhoto() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: 8.0,
          width: 8.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(3.0),
              boxShadow: [BoxShadow(blurRadius: 2.0, spreadRadius: 0.0)]),
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];

    for (int i = 0; i < numberOfDots; ++i) {
      dots.add(i == photoIndex ? _activePhoto() : _inactivePhoto());
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center, children: _buildDots()),
    );
  }
}
