import 'dart:convert';

import 'package:demo/feture/models/post_data_ui_model.dart';
import 'package:http/http.dart' as http;

class PostsRepo {
  static Future<List<PostDataModel>> fetchPost() async {
    var client = http.Client();
    List<PostDataModel> posts = [];
    try {
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        PostDataModel post =
            PostDataModel.fromMap(result[i] as Map<String, dynamic>);
        posts.add(post);
      }
      return posts;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
