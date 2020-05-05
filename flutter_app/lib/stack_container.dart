import 'package:flutter/material.dart';

class StackContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Max Size
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
            height: 300.0,
            width: 300.0,
          ),
          InkWell(
            splashColor: Colors.black.withOpacity(0.2),
            onTap: () {
              print('colore carai');
            },
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                color: Colors.pink,
                height: 150.0,
                width: 150.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
