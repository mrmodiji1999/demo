import 'package:demo/feture/models/post_data_ui_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'posts_client.g.dart';
//flutter pub run build_runner build

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/comments")
abstract class PostsClient {
  factory PostsClient(Dio dio, {String baseUrl}) = _PostsClient;

  @GET("/posts")
  Future<List<PostDataModel>> fetchPosts();
}
