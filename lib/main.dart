import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  PageController pageController = PageController();
  List<Widget> pages = const [ProductsPage(), ScanPage(), FavoritesPage()];
  int selectedIndex = 0;

  onPageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
            pageController.animateToPage(
              selectedIndex,
              duration: const Duration(milliseconds: 200),
              curve: Curves.linear,
            );
          });
        },
      ),
    );
  }
}

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

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeaderText(text: "Scan Page"),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeaderText(text: "Favorites"),
      ),
    );
  }
}

class HeaderText extends StatelessWidget {
  final String text;

  const HeaderText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
    );
  }
}
