import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/generation/generation_cubit.dart';

class StartFetchingWidget extends StatelessWidget {
  const StartFetchingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      key: const Key('landingPage_startWidget'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: Image.asset('assets/pokedex.png'),
          ),
          ElevatedButton(
            key: const Key('startWidget_button'),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Lets start!'),
            ),
            onPressed: () {
              context.read<GenerationCubit>().fetchPokemonGeneration();
            },
          ),
        ],
      ),
    );
  }
}
