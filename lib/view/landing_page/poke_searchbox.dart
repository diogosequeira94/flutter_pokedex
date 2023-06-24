import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/cubit.dart';

class PokeSearchBox extends StatefulWidget {
  const PokeSearchBox({Key? key}) : super(key: key);

  @override
  State<PokeSearchBox> createState() => _PokeSearchBoxState();
}

class _PokeSearchBoxState extends State<PokeSearchBox> {
  late GenerationCubit _generationCubit;
  late TextEditingController _searchBoxController;
  @override
  void initState() {
    _generationCubit = context.read<GenerationCubit>();
    _searchBoxController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _searchBoxController.dispose();
  }

  _onSearchBoxChanged(String input) {
    _generationCubit.searchBoxChanged(input);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14.0, 50.0, 14.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Which Pokémon are you looking for?',
            style: TextStyle(fontSize: 19.0),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      width: 0.5,
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      width: 0.5,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: 'Pokémon name',
                ),
                controller: _searchBoxController,
                keyboardType: TextInputType.text,
                onChanged: (input) {
                  _onSearchBoxChanged(input);
                }),
          ),
        ],
      ),
    );
  }
}
