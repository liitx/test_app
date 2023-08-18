// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/data/repositories/item/item_repository.dart';
import 'package:test_app/data/repositories/item/item_network_service.dart';
import 'package:test_app/data/repositories/music/music_repository.dart';

import 'package:test_app/data/repositories/music/music_network_service.dart';
import 'package:test_app/ui/pages/home/cubits/item/item_cubit.dart';
import 'package:test_app/ui/pages/home/cubits/music/music_cubit.dart';
import 'package:test_app/ui/pages/home/home_page.dart';
// import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // final firebaseApp = Firebase.app();
  // final rtdb = FirebaseDatabase.instanceFor(
  //     app: firebaseApp,
  //     databaseURL: 'https://test-liitx-default-rtdb.firebaseio.com/');
  // DatabaseReference ref = FirebaseDatabase.instance.ref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MusicRepository musicRepository =
        MusicRepository(networkService: MusicNetworkService());

    ItemRepository itemRepository =
        ItemRepository(networkService: ItemNetworkService());
    return MaterialApp(
      title: 'Music',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<MusicCubit>(
            create: (context) => MusicCubit(musicRepository: musicRepository),
          ),
          BlocProvider<ItemCubit>(
            create: (context) => ItemCubit(itemRepository: itemRepository),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
