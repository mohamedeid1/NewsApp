import 'package:app01/shared_ui/navigation_drawer.dart';
import 'package:flutter/material.dart';

class FacebookFeeds extends StatefulWidget {
  @override
  _FacebookFeedsState createState() => _FacebookFeedsState();
}

class _FacebookFeedsState extends State<FacebookFeeds> {
  TextStyle _hashstyle = TextStyle(
    color: Colors.deepOrange,
    fontSize: 16,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FacebookFeed"),
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
                  _drawheader(),
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

  _drawheader() {
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
              onPressed: () {},
              color: Colors.grey,
            ),
            Transform.translate(
              offset: Offset(-10, 0),
              child: Text(
                '25',
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
