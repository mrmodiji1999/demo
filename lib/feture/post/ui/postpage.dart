import 'package:demo/feture/post/bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class postPage extends StatefulWidget {
  const postPage({super.key});

  @override
  State<postPage> createState() => _postPageState();
}

class _postPageState extends State<postPage> {
  final PostsBloc postsBloc = PostsBloc();
  @override
  void initState() {
    postsBloc.add(PostInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('demo'),
      ),
      body: BlocConsumer<PostsBloc, PostsState>(
        bloc: postsBloc,
        listenWhen: (previous, current) => current is PostActionState,
        buildWhen: (previous, current) => current is! PostActionState,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case postFetchingLodingState:
              return Center(
                child: CircularProgressIndicator(),
              );
            case PostFetchScuess:
              final successState = state as PostFetchScuess;

              return Container(
                child: ListView.builder(
                  itemCount: successState.posts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      tileColor: (successState.posts[index].id) % 2 == 0
                          ? (successState.posts[index].id) % 3 == 0
                              ? Color.fromARGB(255, 221, 167, 96)
                              : (successState.posts[index].id) % 5 == 0
                                  ? Colors.red
                                  : Colors.brown
                          : Color.fromARGB(255, 75, 96, 131),
                      leading: Text('${successState.posts[index].id}'),
                      title: Text(successState.posts[index].title),
                      subtitle: Text(successState.posts[index].body),
                      trailing: Text('${successState.posts[index].userId}'),
                    );

                    // Container(

                    //   padding: EdgeInsets.all(16),
                    //   color: Colors.black26,
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [Text(successState.posts[index].title)],
                    //   ),
                    // );
                  },
                ),
              );

              break;
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
