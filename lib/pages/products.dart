import 'package:flutter/material.dart';
import 'package:try_on_app/helpers/custom_text.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const HeaderText(text: "Products"),
          bottom: const TabBar(tabs: [
            Tab(
              icon: ImageIcon(AssetImage('images/shoe_icon.png')),
            ),
            Tab(
              icon: ImageIcon(
                AssetImage('images/watch_icon.png'),
              ),
            ),
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 2,
              // Generate 100 widgets that display their index in the List.
              children: List.generate(100, (index) {
                return Center(
                  child: Image.asset('images/shoePlaceholder.png'),
                );
              }),
            ),
            GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 2,
              // Generate 100 widgets that display their index in the List.
              children: List.generate(100, (index) {
                return Center(
                  child: Image.asset('images/watch_placeholder.png'),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
