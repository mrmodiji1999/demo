import 'package:demo/feture/models/post_data_ui_model.dart';
import 'package:demo/feture/post/repos/posts_client.dart';
import 'package:dio/dio.dart';

import 'posts_client.dart';

class PostsRepo {
  static Future<List<PostDataModel>> fetchPost() async {
    final dio = Dio(); // Create Dio instance
    final client = PostsClient(dio); // Create Retrofit client
    try {
      final posts = await client.fetchPosts(); // Call the fetchPosts method
      return posts;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
