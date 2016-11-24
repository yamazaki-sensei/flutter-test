import 'package:flutter/material.dart';
import 'package:firstapp/ui/search_button.dart';
import 'package:firstapp/client/qiita_api_client.dart';
import 'package:firstapp/entity/qiita_items_factory.dart';
import 'package:firstapp/entity/qiita_item.dart';

void main() {
  runApp(new MaterialApp(
    title: 'My app',
    home: new MyScaffold()
  ));
}

class _QiitaItemsState extends State<MyScaffold> {

  List<QiitaItem> _items;
  ScrollableList _listView;
  Material _view;

  Key _listViewKey = new Key('ListView');

  @override
  Widget build(BuildContext context) {
    var searchButton = new SearchButton();
    searchButton.callback = (SearchButton button) {
      var client = new QiitaClient();
      client.get().then((result) {
        _handleItemsString(result);
      });
    };

    _listView = new ScrollableList(key: _listViewKey, itemExtent:30.0, children:_createWidgets(_items), );
    _view = new Material(
        child: new Column(
            children: <Widget>[
              new MyAppBar(),
              _listView,
              searchButton
            ],
            ),
        );

    return _view;
  }

  void _handleItemsString(var jsonString) {
    setState(() {
      _items = QiitaItemsFactory.create(jsonString);
    });
  }

  Iterable<Widget> _createWidgets(List<QiitaItem> items) {

    var ret = new List<Widget>();
    if(items == null) {
      return ret;
    }

    items.forEach((item) {
      print(item.title);
      ret.add(new Text(item.title));
    });
    return ret;
  }


}
class MyScaffold extends StatefulWidget {
  @override
  _QiitaItemsState createState() {
    return new _QiitaItemsState();
  }
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
