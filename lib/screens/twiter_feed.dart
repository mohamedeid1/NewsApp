import 'package:app01/shared_ui/navigation_drawer.dart';
import 'package:flutter/material.dart';

class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TwitterFeed"),
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
                children: [
                  _cardheader(),
                  _cardbody(),
                  _drawline(),
                  _cardfooter(),
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

  Widget _cardheader() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: ExactAssetImage('assets/images/mohamedeid.png'),
            radius: 24,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Mohamed Eid ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'moh.3id@gmail.com',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text('Fri, 17 sept 2020 .12.39'),
          ],
        ),
      ],
    );
  }

  Widget _cardbody() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 4),
      child: Text(
        'Then there was also the sense that, well, even when we automated other ... the last report that came out in January on automation,',
        style: TextStyle(
          fontSize: 16,
          height: 1.3,
        ),
      ),
    );
  }

  Widget _cardfooter() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                  icon: Icon(Icons.repeat),
                  color: Colors.deepOrange,
                  onPressed: () {}),
              Text(
                '25',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Row(
            children: [
              FlatButton(
                  onPressed: () {},
                  child: Text(
                    'SHARE',
                    style: TextStyle(color: Colors.orange),
                  )),
              FlatButton(
                onPressed: () {},
                child: Text(
                  'OPEN',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _drawline() {
    return Container(
      height: 1,
      color: Colors.grey,
      margin: EdgeInsets.only(
        top: 12,
      ),
    );
  }
}
