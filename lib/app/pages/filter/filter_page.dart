import 'package:flutter/material.dart';

import './../../shared/components/main-drawer/main_drawer.dart';

class FilterPage extends StatelessWidget {
  static const String routeName = '/filter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Filtros'),
      ),
      body: Container(),
    );
  }
}
