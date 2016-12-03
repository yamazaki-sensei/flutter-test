import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  @override build(BuildContext context) {
    return new IconButton(
        icon: new Icon(Icons.search),
        tooltip: 'Search',
        onPressed: _pressed,
        );
  }

  var callback;

  void _pressed() {
    if(callback != null) {
      callback(this);
    }
  }
}

