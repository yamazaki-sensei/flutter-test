import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'My app',
    home: new MyScaffold()
  ));
}
class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
        child: new Column(
            children: <Widget>[
              new MyAppBar(
                  title: new Text('Example title', style: Typography.white.title),
                  ),
              new Flexible(
                  child: new Center(
                      child: new Text('Hello, world!'),
                      ),
                  )
            ],
            ),
        );
  }
}
class MyAppBar extends StatelessWidget {

  MyAppBar({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(backgroundColor: Colors.blue[500]),
      child: new Row(
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          new Flexible(
              child: title,
          ),
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      )
    );
  }
}
