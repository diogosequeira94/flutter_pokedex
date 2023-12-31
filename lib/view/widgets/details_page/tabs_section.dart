import 'package:flutter/material.dart';
import 'package:pokedex/utils/constants.dart';
import 'package:pokedex/view/widgets/details_page/about/about_widget.dart';
import 'package:pokedex/view/widgets/details_page/tabs/tabs.dart';
import 'package:pokemon/pokemon.dart';

class TabsSection extends StatelessWidget {
  final Pokemon pokemon;
  const TabsSection({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 30.0),
      decoration: const BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Constants.tabsTopBorderRadius),
          topRight: Radius.circular(Constants.tabsTopBorderRadius),
        ),
      ),
      child: DefaultTabController(
        key: const Key('tabsSection_tabController'),
        length: 4,
        child: SizedBox(
          height: screenHeight / 2.5,
          child: Column(
            children: <Widget>[
              const Icon(
                Icons.maximize_rounded,
                color: Colors.white,
              ),
              const TabBar(
                indicatorColor: Colors.white,
                labelPadding: EdgeInsets.zero,
                tabs: <Widget>[
                  Tab(
                    text: 'About',
                  ),
                  Tab(
                    text: 'Stats',
                  ),
                  Tab(
                    text: 'Evolutions',
                  ),
                  Tab(
                    text: 'Moves',
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    AboutWidget(pokemon: pokemon),
                    StatsWidget(statsList: pokemon.stats),
                    const EvolutionsChart(),
                    MovesWidget(moves: pokemon.moves),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
