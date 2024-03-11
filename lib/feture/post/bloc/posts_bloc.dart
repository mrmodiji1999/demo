import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:demo/feture/models/post_data_ui_model.dart';
import 'package:demo/feture/post/repos/posts_client.dart';
import 'package:demo/feture/post/repos/ratrofit.dart';
import 'package:demo/feture/post/ui/postpage.dart';
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
    List<PostDataModel> posts = await PostsRepo.fetchPost();

    emit(PostFetchScuess(posts: posts));
  }
}
