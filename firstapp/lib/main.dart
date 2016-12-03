import 'package:flutter/material.dart';
import 'package:firstapp/ui/search_button.dart';
import 'package:firstapp/client/qiita_api_client.dart';
import 'package:firstapp/entity/qiita_items_factory.dart';
import 'package:firstapp/entity/qiita_item.dart';

void main() {
  runApp(new MaterialApp(
    title: 'My app',
    home: new QiitaApp()
  ));
}

class _QiitaItemsState extends State<QiitaApp> {

  List<QiitaItem> _items;

  Key _listViewKey = new Key('ListView');

  @override
  Widget build(BuildContext context) {
    print('build');
    var searchButton = new SearchButton();
    searchButton.callback = (SearchButton button) {
      print('search');
      var client = new QiitaClient();
      client.get().then((result) {
        _handleItemsString(result);
      });
    };

    var listView = new ScrollableList(key: _listViewKey, itemExtent:70.0, children:_createWidgets(_items), );
    var container = new Container(height: 300.0, child: listView);
    return new Material(
        child: new Column(
            children: <Widget>[
              new MyAppBar(),
              container,
              searchButton
            ],
          ),
        );
  }

  void _handleItemsString(var jsonString) {
    setState(() {
      print('setState');
      _items = QiitaItemsFactory.create(jsonString);
    });
  }

  Iterable<Widget> _createWidgets(List<QiitaItem> items) {

    var ret = new List<Widget>();
    if(items == null) {
      print('items is null');
      return ret;
    }
    items.forEach((item) {
      print(item.title);
      ret.add(new Text(item.title));
    });
    return ret;
  }
}

class QiitaApp extends StatefulWidget {
  @override
  _QiitaItemsState createState() {
    return new _QiitaItemsState();
  }
}

class MyAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 55.0,
      decoration: new BoxDecoration(backgroundColor: Colors.blue[500]),
    );
  }
}
