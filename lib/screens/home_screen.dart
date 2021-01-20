import 'package:app01/screens/pages/about.dart';
import 'package:app01/screens/pages/contact.dart';
import 'package:app01/screens/pages/help.dart';
import 'package:app01/screens/pages/setting.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:app01/shared_ui/navigation_drawer.dart';
import 'home_tabs/whats_new.dart';
import 'home_tabs/popular.dart';
import 'home_tabs/favorites.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum Popoutmenu {
  HELP,
  CONTACT,
  SETTING,
  ABOUT,
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore"),
        centerTitle: false,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          _popOutmenu(context),
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              //icon: Icon(Icons.add_circle_outline),
              text: "WHAT'S NEWS",
            ),
            Tab(
              //icon: Icon(Icons.assignment_late),
              text: "Populer",
            ),
            Tab(
              //icon: Icon(Icons.attachment),
              text: "Favorites",
            ),
          ],
          controller: _tabController,
        ),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: TabBarView(
          children: [
            Whatsnew(),
            Popular(),
            Favorites(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }

  Widget _popOutmenu(BuildContext context) {
    return PopupMenuButton<Popoutmenu>(
      itemBuilder: (context) {
        return [
          const PopupMenuItem<Popoutmenu>(
            value: Popoutmenu.ABOUT,
            child: Text('ABOUT'),
          ),
          const PopupMenuItem<Popoutmenu>(
            value: Popoutmenu.SETTING,
            child: Text('SETTING'),
          ),
          const PopupMenuItem<Popoutmenu>(
            value: Popoutmenu.HELP,
            child: Text('HELP'),
          ),
          const PopupMenuItem<Popoutmenu>(
            value: Popoutmenu.CONTACT,
            child: Text('CONTACT'),
          ),
        ];
      },
      onSelected: (Popoutmenu menu) {
        switch (menu) {
          case Popoutmenu.ABOUT:
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AboutUs();
            }));
            break;
          case Popoutmenu.CONTACT:
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ContactUs();
            }));
            break;
          case Popoutmenu.HELP:
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Help();
            }));
            break;
          case Popoutmenu.SETTING:
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Setting();
            }));
            break;
        }
      },
      icon: Icon(Icons.more_vert),
    );
  }
}
