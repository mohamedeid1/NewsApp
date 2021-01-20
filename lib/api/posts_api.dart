import 'package:app01/models/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app01/utilites/api_utilites.dart';

class PostsAPI {
  Future<List<Post>> fetchPostByCategoryId(String id) async {
    String whatsNewApi = base_api + categories_api + id;
    List<Post> posts = List<Post>();
    var response = await http.get(whatsNewApi);
    if (response.statusCode == 200) {
      var jsondata = jsonDecode(response.body);
      var data = jsondata["data"];
      for (var item in data) {
        Post post = Post(
          id: item["id"].toString(),
          title: item["title"].toString(),
          content: item["content"].toString(),
          dateWritten: item["date_written"].toString(),
          featuredImage: item["featured_image"].toString(),
          votesUp: item["votes_up"],
          votesDown: item["votes_down"],
          votersUp: (item["voters_up"] == null
              ? List<int>()
              : jsonDecode(item["voters_up"])),
          votersDown: (item["voters_down"] == null
              ? List<int>()
              : jsonDecode(item["voters_down"])),
          userId: item["user_id"],
          categoryId: item["category_id"],
        );
        posts.add(post);
      }
    }
    return posts;
  }
}
