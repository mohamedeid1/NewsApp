import 'dart:math';

import 'package:app01/models/post.dart';
import 'package:flutter/material.dart';

class SinglePost extends StatefulWidget {
  final Post post;

  SinglePost(this.post);
  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              expandedHeight: 300,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                    decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.post.featuredImage),
                      fit: BoxFit.cover),
                )),
              )),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, position) {
                if (position == 0) {
                  return _drawPostDetailes();
                } else if (position >= 1 && position < 24) {
                  return _comment();
                } else {
                  return _commentTextEntry();
                }
              },
              childCount: 25,
            ),
          ),
        ],
      ),
    );
  }

  final List<Color> circleColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.deepPurple,
    Colors.pink,
    Colors.purpleAccent
  ];

  Color randomGenerator() {
    return circleColors[new Random().nextInt(6)];
  }

  Widget _drawPostDetailes() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          widget.post.content,
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 1.2,
            height: 1.25,
          ),
        ),
      ),
    );
  }

  Widget _comment() {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.post.featuredImage),
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Mohamed"),
                Text("1hour"),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
              "@RonaldKoemanse pone a prueba con fotos de la plantilla azulgrana de cuando eran pequeños de cuando eran pequeños"),
        ),
      ],
    );
  }

  Widget _commentTextEntry() {
    return Container(
      color: Colors.grey.shade200,
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "",
                      hintText: "enter your user name",
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "send",
                  style: TextStyle(
                    color: Colors.red.shade500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
