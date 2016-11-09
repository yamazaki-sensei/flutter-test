import 'package:flutter/material.dart';
import 'package:firstapp/ui/search_button';

void main() {
  runApp(new MaterialApp(
    title: 'My app',
    home: new MyScaffold()
  ));
}
class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchButton = new SearchButton();
    searchButton.callback = (SearchButton button) {
      print("Pressed");
    };
    return new Material(
        child: new Column(
            children: <Widget>[
              new MyAppBar( title: new Text('Example title', style: new Typography(platform: defaultTargetPlatform).white.title)),
              new ScrollableList(key: new Key('Scroll'), itemExtent:30.0, children:_createWidgets(), ),
              searchButton
            ],
          ),
        );
  }
}

Iterable<Widget> _createWidgets() {

  var ret = new List<Widget>();

  for(var i = 0; i < 10; i++) {
    ret.add(new Text('Hello'));
  }
  return ret;
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
