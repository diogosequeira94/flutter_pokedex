import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/cubit.dart';

class EvolutionsChart extends StatelessWidget {
  final String name;
  const EvolutionsChart({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PokemonDetailsCubit>();
    bloc.fetchEvolutions(name);
    return const Center(
      child: Text('Evolutions'),
    );
  }
}
