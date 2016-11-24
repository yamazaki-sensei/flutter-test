import 'package:firstapp/entity/qiita_item.dart';
import 'dart:convert' show JSON;

class QiitaItemsFactory {
  static List<QiitaItem> create(String jsonString) {
    List<Map<String, Object>> json = JSON.decode(jsonString);

    return json.map((dic) {
      var item = new QiitaItem();
      item.url = dic['url'];
      item.title = dic['title'];
      item.imageUrl = dic['user']['profile_image_url'];
      return item;
    }).toList();
  }
}