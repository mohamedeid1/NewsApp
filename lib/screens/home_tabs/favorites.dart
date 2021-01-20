import 'dart:math';

import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<Color> colorsList = [
    Colors.red,
    Colors.blueAccent,
    Colors.purple,
    Colors.green,
    Colors.pink,
    Colors.orangeAccent,
  ];
  Random random = Random();
  Color _getrandomcolor() {
    return colorsList[random.nextInt(colorsList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _authorROw(),
                  SizedBox(
                    height: 12,
                  ),
                  _newsitemRow(),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: 20,
    );
  }

  Widget _authorROw() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/whatsnews_bg.png'),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
              width: 40,
              height: 40,
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Maichel adams",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "15 Min .",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "life style",
                      style: TextStyle(
                        color: _getrandomcolor(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.bookmark_border),
          onPressed: () {},
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget _newsitemRow() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/images/whatsnews_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          width: 125,
          height: 125,
          margin: EdgeInsets.only(right: 16),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                'tech tent: old phone and safe social',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'we also talk about the future of work as the robots advance , and we ask wether retro phone',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
