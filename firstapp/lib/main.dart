import 'package:flutter/material.dart';
import 'package:firstapp/ui/search_button.dart';
import 'package:firstapp/client/qiita_api_client.dart';
import 'package:firstapp/entity/qiita_items_factory.dart';

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
      print('start');
      var client = new QiitaClient();
      client.get().then((result) {
        _handleItemsString(result);
        print('end');
      });
    };
    return new Material(
        child: new Column(
            children: <Widget>[
              new MyAppBar(),
              new ScrollableList(key: new Key('Scroll'), itemExtent:30.0, children:_createWidgets(), ),
              searchButton
            ],
          ),
        );
  }

  _handleItemsString(var jsonString) {
    var items = QiitaItemsFactory.create(jsonString);
    items.forEach((item) {
      print('title = ' + item.title);
    });
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
        ],
      )
    );
  }
}
