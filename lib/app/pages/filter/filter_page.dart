import 'package:flutter/material.dart';

import './../../shared/components/main-drawer/main_drawer.dart';

class FilterPage extends StatefulWidget {
  static const String routeName = '/filter';

  final Function setFilterHandler;
  var filters;

  FilterPage({this.setFilterHandler, this.filters});

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filters['gluten'];
    _vegetarian = widget.filters['vegetarian'];
    _vegan = widget.filters['vegan'];
    _lactoseFree = widget.filters['lactose'];

    super.initState();
  }

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
                    widget.setFilterHandler(
                      gluten: _glutenFree,
                      lactose: _lactoseFree,
                      vegan: _vegan,
                      vegetarian: _vegetarian,
                    );
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
                    widget.setFilterHandler(
                      gluten: _glutenFree,
                      lactose: _lactoseFree,
                      vegan: _vegan,
                      vegetarian: _vegetarian,
                    );
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
                    widget.setFilterHandler(
                      gluten: _glutenFree,
                      lactose: _lactoseFree,
                      vegan: _vegan,
                      vegetarian: _vegetarian,
                    );
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
                    widget.setFilterHandler(
                      gluten: _glutenFree,
                      lactose: _lactoseFree,
                      vegan: _vegan,
                      vegetarian: _vegetarian,
                    );
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
