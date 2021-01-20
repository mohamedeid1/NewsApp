import 'dart:math';

import 'package:app01/models/post.dart';
import 'package:app01/screens/single_post.dart';
import 'package:flutter/material.dart';
import 'package:app01/api/posts_api.dart';
import 'dart:async';
import 'package:app01/utilites/data_utilites.dart';
import 'package:http/http.dart';
import 'package:timeago/timeago.dart' as timeago;

class Whatsnew extends StatefulWidget {
  @override
  _WhatsnewState createState() => _WhatsnewState();
}

class _WhatsnewState extends State<Whatsnew> {
  PostsAPI postsAPI = PostsAPI();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _drawheader(),
          _drawTopstories(),
          _drawrecentUpdates(),
        ],
      ),
    );
  }

  Widget _drawTopstories() {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: _drawsectiontitles('Top Stories'),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Card(
              child: FutureBuilder(
                future: postsAPI.fetchPostByCategoryId("1"),
                builder: (context, AsyncSnapshot snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return loading();
                      break;
                    case ConnectionState.active:
                      return loading();
                      break;
                    case ConnectionState.none:
                      return connectionerror();
                      break;
                    case ConnectionState.done:
                      if (snapshot.error != null) {
                        return error(snapshot.error);
                      } else {
                        if (snapshot.hasData) {
                          List<Post> posts = snapshot.data;
                          if (posts.length >= 3) {
                            Post post1 = snapshot.data[0];
                            Post post2 = snapshot.data[1];
                            Post post3 = snapshot.data[2];
                            return Column(
                              children: [
                                _drawsinglerow(post1),
                                _drawdivider(),
                                _drawsinglerow(post2),
                                _drawdivider(),
                                _drawsinglerow(post3),
                              ],
                            );
                          } else {
                            return noData();
                          }
                        } else {
                          return noData();
                        }
                      }
                      break;
                  }
                  Post post1 = snapshot.data[0];
                  Post post2 = snapshot.data[1];
                  Post post3 = snapshot.data[2];
                  return Column(
                    children: [
                      _drawsinglerow(post1),
                      _drawdivider(),
                      _drawsinglerow(post2),
                      _drawdivider(),
                      _drawsinglerow(post3),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawrecentUpdates() {
    return Padding(
      padding: EdgeInsets.only(left: 16, top: 8),
      child: FutureBuilder(
          future: postsAPI.fetchPostByCategoryId("2"),
          builder: (context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return loading();
                break;
              case ConnectionState.active:
                return loading();
                break;
              case ConnectionState.none:
                return connectionerror();
                break;
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return error(snapshot.error);
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _drawsectiontitles('Recent Update'),
                      ),
                      _drawrecentupdate(Colors.deepOrange, snapshot.data[0]),
                      _drawrecentupdate(Colors.teal, snapshot.data[1]),
                      SizedBox(
                        height: 48,
                      ),
                    ],
                  );
                }
                break;
            }
          }),
    );
  }

  Widget _drawheader() {
    TextStyle _headertitle = TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontWeight: FontWeight.w600,
    );
    TextStyle _headerdiscription = TextStyle(
      color: Colors.white,
      fontSize: 18,
    );
    return FutureBuilder(
        future: postsAPI.fetchPostByCategoryId("1"),
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return loading();
              break;
            case ConnectionState.active:
              return loading();
              break;
            case ConnectionState.none:
              return connectionerror();
              break;
            case ConnectionState.done:
              if (snapshot.hasError) {
                return error(snapshot.error);
              } else {
                List<Post> posts = snapshot.data;
                Random random = Random();
                int randomIndex = random.nextInt(posts.length);
                Post post = posts[randomIndex];
                return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SinglePost(post);
                      }));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(post.featuredImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 50, right: 50),
                              child: Text(
                                post.title,
                                style: _headertitle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 32, right: 32),
                              child: Text(
                                post.content.substring(0, 75),
                                style: _headerdiscription,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
              }
              break;
          }
        });
  }

  Widget _drawsinglerow(Post post) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SinglePost(post);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            SizedBox(
              width: 125,
              height: 125,
              child: Image.network(
                post.featuredImage,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    post.title,
                    maxLines: 2,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("machial adams"),
                      Row(
                        children: [
                          Icon(Icons.timer),
                          Text(parseHumanDateTime(post.dateWritten)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _drawdivider() {
    return Container(
      height: 2,
      width: double.infinity,
      color: Colors.grey.shade200,
    );
  }

  Widget _drawsectiontitles(String titles) {
    return Text(
      titles,
      style: TextStyle(
        color: Colors.grey.shade700,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    );
  }

  _drawrecentupdate(Color color, Post post) {
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SinglePost(post);
          }));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(post.featuredImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 12, top: 12),
                child: Container(
                  padding:
                      EdgeInsets.only(left: 24, right: 24, top: 2, bottom: 3),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "sport",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              child: Text(
                post.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
              child: Row(
                children: [
                  Icon(
                    Icons.timer,
                    color: Colors.grey.shade700,
                    size: 16,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    parseHumanDateTime(post.dateWritten),
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
