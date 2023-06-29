import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/cubit.dart';
import 'package:pokemon/pokemon.dart';

class EvolutionsChart extends StatelessWidget {
  const EvolutionsChart({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
      builder: (context, state) {
        if (state is PokemonDetailsSuccess) {
          final evolution = state.pokemon.evolution?.evolutions;
          return evolution == null
              ? const Center(
                  child: Text(
                    'This Pokémon does not evolve.',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _EvolutionRow(
                          currentForm: evolution[0],
                          evolvedForm: evolution[1],
                        ),
                        if (evolution.length > 2)
                          _EvolutionRow(
                            currentForm: evolution[1],
                            evolvedForm: evolution[2],
                          ),
                      ],
                    ),
                  ),
                );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _EvolutionRow extends StatelessWidget {
  final String currentForm, evolvedForm;
  final String? reason;
  const _EvolutionRow({Key? key, required this.currentForm, required this.evolvedForm, this.reason}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _sizedContainer(
          CachedNetworkImage(
            imageUrl: PokemonEndpoints.getPokemonSprite(currentForm),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Column(
            children: [
              SizedBox(
                width: 65,
                height: 65,
                child: Image.asset('assets/arrow.png'),
              ),
              if (reason != null && reason!.isNotEmpty) Text(reason!, style: const TextStyle(color: Colors.white)),
            ],
          ),
        ),
        _sizedContainer(
          CachedNetworkImage(
            imageUrl: PokemonEndpoints.getPokemonSprite(evolvedForm),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ],
    );
  }

  Widget _sizedContainer(Widget child) {
    return SizedBox(
      width: 125.0,
      height: 125.0,
      child: child,
    );
  }
}
