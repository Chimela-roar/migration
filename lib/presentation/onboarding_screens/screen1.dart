import 'package:flutter/material.dart';
import 'package:migration/utility/size_config.dart';

class Screen1 extends StatelessWidget {
  const Screen1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image.asset(
              'images/Fast.png',
              scale: 5,
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 4,
          ),
          Center(
            child: Text(
              'Fast Delivery',
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  letterSpacing: 3,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 4,
          ),
          Center(
            child: Text(
              'Fast delivery to any part in Nigeria',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
