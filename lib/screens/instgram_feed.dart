import 'package:app01/shared_ui/navigation_drawer.dart';
import 'package:flutter/material.dart';

class InstgramFeeds extends StatefulWidget {
  @override
  _InstgramFeedsState createState() => _InstgramFeedsState();
}

class _InstgramFeedsState extends State<InstgramFeeds> {
  TextStyle _hashstyle = TextStyle(
    color: Colors.deepOrange,
    fontSize: 16,
  );
  List<int> ids = [0, 2, 7];
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InstgramFeed"),
        centerTitle: false,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _drawheader(position),
                  _drawtitle(),
                  _drawhash(),
                  _drawbody(),
                  _drawfooter(),
                ],
              ),
            ),
          );
        },
        itemCount: 20,
      ),
      drawer: NavigationDrawer(),
    );
  }

  _drawheader(int position) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage:
                    ExactAssetImage('assets/images/mohamedeid.png'),
                radius: 24,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mohamed Eid ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 8,
                ),
                SizedBox(
                  height: 8,
                ),
                Text('Fri, 17 sept 2020 .12.39'),
              ],
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                if (ids.contains(position)) {
                  ids.remove(position);
                  _count++;
                  print(_count);
                } else {
                  ids.add(position);
                  _count--;
                  print(_count);
                }
                setState(() {});
              },
              color:
                  (ids.contains(position)) ? Colors.red : Colors.grey.shade400,
            ),
            Transform.translate(
              offset: Offset(-10, 0),
              child: Text(
                "$_count",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _drawtitle() {
    return Padding(
      padding: EdgeInsets.only(bottom: 8, right: 16, left: 16),
      child: Text(
        "mainAxisAlignment: MainAxisAlignment.spaceBe,",
        style: TextStyle(
          color: Colors.grey.shade900,
        ),
      ),
    );
  }

  _drawhash() {
    return Container(
      child: Wrap(
        children: [
          FlatButton(
            onPressed: () {},
            child: Text(
              "#Advance",
              style: _hashstyle,
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Text(
              "#Advance",
              style: _hashstyle,
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Text(
              "#Advance",
              style: _hashstyle,
            ),
          ),
        ],
      ),
    );
  }

  _drawbody() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: ExactAssetImage("assets/images/hotel_1.png"),
            fit: BoxFit.cover),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(38.0),
          topRight: Radius.circular(38.0),
        ),
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
    );
  }

  _drawfooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FlatButton(
          onPressed: () {},
          child: Text(
            '10COMMENT',
            style: _hashstyle,
          ),
        ),
        Row(
          children: [
            FlatButton(
              onPressed: () {},
              child: Text(
                'SHARE',
                style: _hashstyle,
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                'OPEN',
                style: _hashstyle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
