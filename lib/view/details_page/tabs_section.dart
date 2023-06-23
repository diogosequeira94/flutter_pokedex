import 'package:flutter/material.dart';
import 'package:pokedex/view/details_page/about_widget.dart';
import 'package:pokedex/view/details_page/details_page.dart';
import 'package:pokemon/pokemon.dart';

class TabsSection extends StatelessWidget {
  final List<Stats> statsList;
  const TabsSection({Key? key, required this.statsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22.0),
          topRight: Radius.circular(22.0),
        ),
      ),
      child: DefaultTabController(
        length: 4,
        child: SizedBox(
          height: 400.0,
          child: Column(
            children: <Widget>[
              const TabBar(
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
                    AboutWidget(),
                    StatsWidget(statsList: statsList),
                    StatsWidget(statsList: statsList),
                    StatsWidget(statsList: statsList),
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
