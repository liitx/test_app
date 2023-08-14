import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/ui/pages/home/cubits/post/post_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final postContoller = BlocProvider.of<PostCubit>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Fetched DATA'),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: BlocBuilder<PostCubit, PostState>(
              builder: (context, state) {
                if (state is PostInitial) {
                  return Center(
                    child: Column(
                      children: [
                        Text(state.initialMessage.toString()),
                        ElevatedButton(
                            onPressed: () {
                              postContoller.fetchPost();
                            },
                            child: const Text('Refresh'))
                      ],
                    ),
                  );
                } else if (state is PostLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is PostLoaded) {
                  final post = (state).post;
                  return SingleChildScrollView(
                    child: Column(children: [
                      ...post.map((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                height: MediaQuery.sizeOf(context).height * .35,
                                child: Card(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      // Text(
                                      //     ': ${e.userId.toString()}'),
                                      // Divider(),
                                      Text('ID: ${e.id.toString()}'),
                                      const Divider(),
                                      Text('TITLE: ${e.title.toString()}'),
                                      const Divider(),
                                      Text('BODY: ${e.body.toString()}'),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ElevatedButton(
                                                onPressed: () {},
                                                child: const Text(
                                                  'Favorite',
                                                  style: TextStyle(
                                                      color: Colors.orange),
                                                )),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            ElevatedButton(
                                                onPressed: () {
                                                  postContoller
                                                      .deletePost(e.id);
                                                },
                                                child: const Text(
                                                  'Delete',
                                                  style: TextStyle(
                                                      color: Colors.redAccent),
                                                ))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ))),
                          )),
                    ]),
                  );
                } else if (state is PostError) {
                  return Text(state.errorMessage.toString());
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                // if (state is PostInitial) {
                //   return buildInitialInput();
                // } else if (state is PostLoading) {
                //   return buildLoading();
                // } else if (state is PostLoaded) {
                //   final post = (state as PostLoaded).post;
                //   return buildLoaded(post, context);
                // } else if (state is PostError) {
                //   return buildError(state);
                // } else {
                //   return buildInitialInput();
                // }
              },
            ),
          ),
        ),
      ),
    );
  }
}
