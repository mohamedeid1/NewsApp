import 'package:app01/models/auther.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app01/utilites/api_utilites.dart';

class AuthorsAPI {
  Future<List<Author>> fetchAllAuthors() async {
    List<Author> authors = List<Author>();
    String allAuthorApi = base_api + all_author_api;
    var response = await http.get(allAuthorApi);
    if (response.statusCode == 200) {
      var jsondata = jsonDecode(response.body);
      var data = jsondata["data"];
      for (var item in data) {
        Author author = Author(item['id'].toString(), item['name'].toString(),
            item['email'].toString(), item['avatar'].toString());
        authors.add(author);
        print(author.email);
      }
    }
    return authors;
  }
}
