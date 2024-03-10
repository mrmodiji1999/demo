import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:demo/feture/models/post_data_ui_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import 'package:http/http.dart' as http;
part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostInitialFetchEvent>(postInitialFetchEvent);
  }

  FutureOr<void> postInitialFetchEvent(
      PostInitialFetchEvent event, Emitter<PostsState> emit) async {
    emit(postFetchingLodingState());
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
      print(posts);
      emit(PostFetchScuess(posts: posts));
    } catch (e) {
      emit(postFetchingerrorState());
      print(e.toString());
    }
  }
}
