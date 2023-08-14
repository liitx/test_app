import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/ui/pages/home/cubits/post/post_cubit.dart';
import 'package:test_app/ui/pages/home/helper_functions.dart';

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
                  return buildInitialInput(
                      context: context,
                      state: state,
                      postController: postContoller);
                } else if (state is PostLoading) {
                  return buildLoading();
                } else if (state is PostLoaded) {
                  final posts = state.post;
                  return buildLoaded(
                      context: context,
                      state: state,
                      postController: postContoller,
                      posts: posts);
                } else if (state is PostError) {
                  return buildError(state: state);
                } else {
                  return buildError(state: state);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
