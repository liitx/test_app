import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/ui/pages/home/cubits/item/item_cubit.dart';
// import 'package:test_app/ui/pages/home/cubits/music/music_cubit.dart';
import 'package:test_app/ui/pages/home/helper_functions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final musicController = BlocProvider.of<MusicCubit>(context);
    final itemController = BlocProvider.of<ItemCubit>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Fetched DATA'),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: BlocBuilder<ItemCubit, ItemState>(
              builder: (context, state) {
                if (state is ItemInitialState) {
                  return buildInitialInput(
                      context: context,
                      state: state,
                      itemContoller: itemController);
                } else if (state is ItemLoadingState) {
                  return buildLoading();
                } 
                else if (state is ItemLoadedState) {

                  return buildLoaded(
                      context: context,
                      state: state,
                      itemController: itemController,);
                } 
                else if (state is ItemErrorState) {
                  return buildError(state: state);
                } else {
                  return buildLoading();
                }
              },
            ),
            // child: BlocBuilder<MusicCubit, MusicState>(
            //   builder: (context, state) {
            //     if (state is MusicInitialState) {
            //       return buildInitialInput(
            //           context: context,
            //           state: state,
            //           musicController: musicController);
            //     } else if (state is MusicLoadingState) {
            //       return buildLoading();
            //     } else if (state is MusicLoadedState) {
            //       final music = state.music;
            //       return buildLoaded(
            //           context: context,
            //           state: state,
            //           musicController: musicController,
            //           music: music);
            //     } else if (state is MusicErrorState) {
            //       return buildError(state: state);
            //     } else {
            //       return buildError(state: state);
            //     }
            //   },
            // ),
          ),
        ),
      ),
    );
  }
}
