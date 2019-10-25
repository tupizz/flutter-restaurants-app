import 'package:flutter/material.dart';

import './../../shared/components/main-drawer/main_drawer.dart';

class FilterPage extends StatefulWidget {
  static const String routeName = '/filter';

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Filtros'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Ajuste suas preferências de refeição',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          // Child widget take as much as can take of space
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile(
                  context: context,
                  title: 'Gluten free',
                  subTitle: 'Incluir apenas pratos livres de gluten',
                  currentValue: _glutenFree,
                  onUpdate: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  context: context,
                  title: 'Vegetariano',
                  subTitle: 'Incluir apenas opções vegetarianas',
                  currentValue: _vegetarian,
                  onUpdate: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  context: context,
                  title: 'Vegano',
                  subTitle: 'Incluir apenas pratos veganos',
                  currentValue: _vegan,
                  onUpdate: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  context: context,
                  title: 'Lacrose free',
                  subTitle: 'Incluir apenas pratos livres de lactose',
                  currentValue: _lactoseFree,
                  onUpdate: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile({
    BuildContext context,
    String title,
    String subTitle,
    bool currentValue,
    Function onUpdate,
  }) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.display1,
      ),
      value: currentValue,
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.display2,
      ),
      inactiveTrackColor: Colors.white38,
      onChanged: onUpdate,
    );
  }
}
