import 'package:flutter/material.dart';

class OpacityContainer extends StatefulWidget {
  final String title;

  const OpacityContainer({Key key, this.title}) : super(key: key);

  @override
  _OpacityContainerState createState() => _OpacityContainerState();
}

class _OpacityContainerState extends State<OpacityContainer> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Call setState. This tells Flutter to rebuild the
          // UI with the changes.
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: 'Toggle Opacity',
        child: Icon(Icons.flip),
      ),
    );
  }
}
