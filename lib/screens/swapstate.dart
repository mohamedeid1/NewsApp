import 'package:app01/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Swapstate extends StatefulWidget {
  @override
  _SwapstateState createState() => _SwapstateState();
}

class _SwapstateState extends State<Swapstate> {
  List<PageModel> pages = List<PageModel>();
  ValueNotifier<int> _pageviewnotifier = ValueNotifier(0);
  void _addpages() {
    pages.add(PageModel('Yes - XRP Will Go To Four Digits ', Icons.ac_unit,
        'assets/images/bg.png', 'welcome'));
    pages.add(PageModel('Yes - It Will Happen In The Blink Of An Eye ',
        Icons.access_alarms, 'assets/images/bg1.png', 'alarm'));
    pages.add(PageModel('No - You Don’t Have To Believe Me ', Icons.account_box,
        'assets/images/bg2.png', 'account_box'));
    pages.add(PageModel(
        'Yes- Everything I Said Has Happened This Year',
        Icons.account_balance_wallet,
        'assets/images/bg3.png',
        'account wallet'));
  }

  @override
  Widget build(BuildContext context) {
    _addpages();
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            //elevation: 0,
          ),
          body: PageView.builder(
              itemBuilder: (context, index) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage(pages[index].images),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Transform.translate(
                          child: Icon(
                            pages[index].icons,
                            size: 80,
                            color: Colors.white,
                          ),
                          offset: Offset(0, -80),
                        ),
                        Text(
                          pages[index].titles,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 35,
                              color: Colors.pink),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 48, right: 48, top: 18, bottom: 18)),
                        Text(
                          pages[index].des,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.deepPurple),
                        ),
                      ],
                    ),
                  ],
                );
              },
              itemCount: pages.length,
              onPageChanged: (index) {
                _pageviewnotifier.value = index;
              }),
        ),
        Transform.translate(
          offset: Offset(0, 250),
          child: Align(
              alignment: Alignment.center,
              child: _displaypageindicator(pages.length)),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 24, left: 16, right: 16),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                color: Colors.red.shade800,
                child: Text(
                  "Get started",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      _updateSeen();
                      return HomeScreen();
                    }),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _displaypageindicator(int length) {
    return PageViewIndicator(
      pageIndexNotifier: _pageviewnotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.red,
        ),
      ),
    );
  }

  void _updateSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
  }
}

class PageModel {
  String _titles;
  String _images;
  String _des;
  IconData _icons;
  PageModel(this._des, this._icons, this._images, this._titles);

  String get images => _images;
  String get des => _des;
  String get titles => _titles;
  IconData get icons => _icons;
}
