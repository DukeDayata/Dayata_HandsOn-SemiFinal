import 'dart:convert';
import 'package:http/http.dart' as http;

class HTTPhrlper {
  ///Fatching All items
  Future<List<Map>> fetchitem() async {
    List<Map> items = [];
    http.Response response =
    await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    if (response.statusCode == 200) {
      String jsonString = response.body;

      List data = jsonDecode(jsonString);

      items = data.cast<Map>();
    }
// /get data from API
    return items;
  }

  ///get on of the item
  Future<Map> getItem(itemId) async {
    Map item = {};

    //Get the item from the API
    http.Response response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$itemId'));

    if (response.statusCode == 200) {
      //get the data from the response
      String jsonString = response.body;
      //Convert to List<Map>
      item = jsonDecode(jsonString);
    }

    return item;
  }
}