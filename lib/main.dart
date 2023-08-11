import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/data/network_service.dart';
import 'package:test_app/data/repository.dart';
import 'package:test_app/ui/pages/home/cubits/post/post_cubit.dart';
import 'package:test_app/ui/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Repository repository = Repository(networkService: NetworkService());
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => PostCubit(repository: repository),
        child: const HomePage(),
      ),
    );
  }
}
