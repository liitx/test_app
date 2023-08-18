import 'package:flutter/material.dart';
// import 'package:test_app/data/models/item/item_entity.dart';
// import 'package:test_app/ui/pages/home/cubits/post/post_cubit.dart';
import 'package:test_app/ui/pages/home/cubits/item/item_cubit.dart';

buildInitialInput(
    {required BuildContext context,
    required ItemInitialState state,
    required ItemCubit itemContoller}) {
  return Center(
    child: Column(
      children: [
        Text(state.initialMessage.toString()),
        ElevatedButton(
            onPressed: () {
              itemContoller.getItem();
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
  required ItemLoadedState state,
  required ItemCubit itemController,
}) {
  final item = (state).item;
  return SingleChildScrollView(
    child: Column(children: [
      Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                height: MediaQuery.sizeOf(context).height * .39,
                child: Card(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('ItemId: ${item.itemId.toString()}'),
                      const Divider(),
                      Text('Query: ${item.q.toString()}'),
                      const Divider(),
                      // Text('TITLE: ${e.title.toString()}'),
                      // const Divider(),
                      // Text('BODY: ${e.body.toString()}'),
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
                                  // postController.deletePost(e.id);
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
          ),
    ]),
  );
}

buildError({required state}) {
  return Text(state.errorMessage.toString());
}





// import 'package:flutter/material.dart';
// import 'package:test_app/ui/pages/home/cubits/item/item_cubit.dart';
// import 'package:test_app/ui/pages/home/cubits/music/music_cubit.dart';

// buildInitialInput({
//   required BuildContext context,
//   // required MusicInitialState state,
//   required ItemInitialState state,
//   // required MusicCubit musicController
//   required ItemCubit itemController,
// }) {
//   return Center(
//     child: Column(
//       children: [
//         Text(state.initialMessage.toString()),
//         ElevatedButton(
//             onPressed: () {
//               // musicController.getMusic();
//               itemController.getItem();
//             },
//             child: const Text('Refresh'))
//       ],
//     ),
//   );
// }

// buildLoading() {
//   return const Center(
//     child: CircularProgressIndicator(),
//   );
// }

// buildLoaded({
//   required BuildContext context,
//   // required MusicLoadedState state,
//   required ItemLoadedState state,
//   // music,
//   items,
//   // required MusicCubit musicController,
//   required ItemCubit itemController,
// }) {
//   return SingleChildScrollView(
//     child: Column(children: [
//       ...items.map((e) => Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SizedBox(
//                 height: MediaQuery.sizeOf(context).height * .39,
//                 child: Card(
//                     child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       // Text('UserID: ${}'),
//                       // const Divider(),
//                       Text('ID: ${e.id.toString()}'),
//                       const Divider(),
//                       Text('TITLE: ${e.title.toString()}'),
//                       const Divider(),
//                       Text('BODY: ${e.body.toString()}'),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10, bottom: 10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             ElevatedButton(
//                                 onPressed: () {},
//                                 child: const Text(
//                                   'Favorite',
//                                   style: TextStyle(color: Colors.orange),
//                                 )),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             // ElevatedButton(
//                             //     onPressed: () {
//                             //       // musicController.deleteMusic(e.id);
//                             //     },
//                             //     child: const Text(
//                             //       'Delete',
//                             //       style: TextStyle(color: Colors.redAccent),
//                             //     ))
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ))),
//           )),
//     ]),
//   );
// }

// buildError({required state}) {
//   return Text(state.errorMessage.toString());
// }

