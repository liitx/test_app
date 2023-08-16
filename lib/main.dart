import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/data/network_service.dart';
import 'package:test_app/data/notes_repository.dart';
import 'package:test_app/ui/pages/home/cubits/post/post_cubit.dart';
import 'package:test_app/ui/pages/home/home_page.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final firebaseApp = Firebase.app();
  final rtdb = FirebaseDatabase.instanceFor(
      app: firebaseApp,
      databaseURL: 'https://test-liitx-default-rtdb.firebaseio.com/');
  DatabaseReference ref = FirebaseDatabase.instance.ref();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    NotesRepository notesRepository =
        NotesRepository(networkService: NetworkService());
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => PostCubit(notesRepository: notesRepository),
        child: const HomePage(),
      ),
    );
  }
}
