import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            padding: const EdgeInsets.all(20),
            // os filhos do container serao ordenados da seguinte forma
            alignment: Alignment.centerLeft,
            child: Text(
              'Menu',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          buildListItemMenu('Tipos de Prato', Icons.restaurant, context),
          buildListItemMenu('Filtros', Icons.filter_list, context),
        ],
      ),
    );
  }

  Column buildListItemMenu(String title, IconData icon, BuildContext context) =>
      Column(
        children: <Widget>[
          ListTile(
            dense: true,
            onTap: () {},
            leading: Icon(
              icon,
              size: 20,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Divider(
            color: Theme.of(context).primaryColor,
          )
        ],
      );
}
