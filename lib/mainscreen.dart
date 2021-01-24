import 'package:flutter/material.dart';

import 'user.dart';

class MainScreen extends StatefulWidget {
  final User user;

  const MainScreen({Key key, this.user}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GlobalKey<RefreshIndicatorState> refreshKey;

  List restList;
  double screenHeight, screenWidth;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    TextEditingController _foodnamecontroller = TextEditingController();

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        //title: Text('Available Restaurants'),
        actions: <Widget>[
          Container(
              width: screenWidth / 2.2,
              padding: EdgeInsets.fromLTRB(3, 10, 1, 10),
              child: TextField(
                autofocus: false,
                controller: _foodnamecontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(5.0),
                    ),
                  ),
                  prefixIcon: Icon(Icons.fastfood),
                ),
              )),
          SizedBox(width: 5),
          Flexible(
            child: IconButton(
              icon: Icon(Icons.search),
              iconSize: 24,
              onPressed: () {},
            ),
          ),
          IconButton(
            icon: _visible
                ? new Icon(Icons.expand_more)
                : new Icon(Icons.expand_less),
            onPressed: () {
              setState(() {
                if (_visible) {
                  _visible = false;
                } else {
                  _visible = true;
                }
              });
            },
          ),

          //
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //_bookScreen();
        },
        icon: Icon(Icons.add_shopping_cart),
        label: Text("10"),
      ),
      body: Column(
        children: [
          //Divider(color: Colors.grey),
          Visibility(
            visible: _visible,
            child: Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Select Location"),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  5.0) //                 <--- border radius here
                              ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(width: 10),
                  //dropdown for sort by
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Rating"),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  5.0) //                 <--- border radius here
                              ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(color: Colors.grey),
        ],
      ),
    ));
  }
}
