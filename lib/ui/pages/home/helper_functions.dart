import 'package:flutter/material.dart';
import 'package:test_app/ui/pages/home/cubits/post/post_cubit.dart';

buildInitialInput(
    {required BuildContext context,
    required PostInitial state,
    required PostCubit postController}) {
  return Center(
    child: Column(
      children: [
        Text(state.initialMessage.toString()),
        ElevatedButton(
            onPressed: () {
              postController.fetchPost();
            },
            child: const Text('Refresh'))
      ],
    ),
  );
}

buildLoading() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

buildLoaded({
  required BuildContext context,
  required PostLoaded state,
  posts,
  required PostCubit postController,
}) {
  return SingleChildScrollView(
    child: Column(children: [
      ...posts.map((e) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                height: MediaQuery.sizeOf(context).height * .39,
                child: Card(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('UserID: ${e.userId.toString()}'),
                      const Divider(),
                      Text('ID: ${e.id.toString()}'),
                      const Divider(),
                      Text('TITLE: ${e.title.toString()}'),
                      const Divider(),
                      Text('BODY: ${e.body.toString()}'),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  'Favorite',
                                  style: TextStyle(color: Colors.orange),
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  postController.deletePost(e.id);
                                },
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.redAccent),
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
}

buildError({required state}) {
  return Text(state.errorMessage.toString());
}
