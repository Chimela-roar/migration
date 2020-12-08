import 'package:flutter/material.dart';
import 'package:migration/utility/size_config.dart';

class Screen2 extends StatelessWidget {
  const Screen2({
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
            child: Image.asset('images/marginalia-753.png'),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier,
          ),
          Center(
            child: Text(
              'Door to Door Delivery',
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
              'We deliver to your doorstep',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
