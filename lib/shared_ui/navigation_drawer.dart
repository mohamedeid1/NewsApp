import 'package:app01/screens/Facebook_feed.dart';
import 'package:app01/screens/headlinenews.dart';
import 'package:app01/screens/home_screen.dart';
import 'package:app01/screens/instgram_feed.dart';
import 'package:app01/screens/twiter_feed.dart';
import 'package:flutter/material.dart';
import 'package:app01/models/nav_menu.dart';
import 'package:app01/utilites/app_utilites.dart';
import 'package:app01/screens/pages/login.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  NavigationDrawerState createState() => NavigationDrawerState();
}

class NavigationDrawerState extends State<NavigationDrawer> {
  bool isLoggedIn = true;
  List<NavmenuItem> navigationMenu = [
    NavmenuItem("Explore", () => HomeScreen()),
    NavmenuItem("HeadlineNews", () => HeadlineNews()),
    NavmenuItem("TwitterFeed", () => TwitterFeed()),
    NavmenuItem("InstgramFeeds", () => InstgramFeeds()),
    NavmenuItem("FacebookFeeds", () => FacebookFeeds()),
    // NavmenuItem("Register", ()=> Register()),
    NavmenuItem("Login", () => Login()),
    //NavmenuItem("LogOut", ()=> LogOut()),
  ];
  @override
  void initState() {
    super.initState();
    if (isLoggedIn) {
      navigationMenu.add(NavmenuItem("LogOut", () => FacebookFeeds()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 60, left: 24),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                title: Text(
                  navigationMenu[position].titles,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 20,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade400,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          navigationMenu[position].destination(),
                    ),
                  );
                },
              ),
            );
          },
          itemCount: navigationMenu.length,
        ),
      ),
    );
  }
}
