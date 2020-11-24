import 'package:flutter/material.dart';
import 'package:migration/utility/size_config.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List pictures = ['image/'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.purple,
            onPressed: () {
              return showDialog(
                  context: context,
                  builder: (c) => AlertDialog(
                        title: Text('Warning'),
                        content: Text('Do you really want to exit'),
                        actions: [
                          FlatButton(
                            child: Text('Yes'),
                            onPressed: () => Navigator.pop(c, true),
                          ),
                          FlatButton(
                            child: Text('No'),
                            onPressed: () => Navigator.pop(c, false),
                          ),
                        ],
                      ));
            },
            child: Icon(Icons.shopping_cart),
          ),
          body: Container(
              height: SizeConfig.heightMultiplier * 100,
              child: GridView.builder(itemBuilder: null))),
    );
  }
}
