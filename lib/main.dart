import 'package:flutter/material.dart';
import 'package:testapp/additemspage.dart';
import 'package:testapp/items.dart';
import 'package:testapp/models/itemmodel.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  // Initialize a list of items
  final List<Item> items = [
    Item(title: "Item 1", description: "This if the first item")
  ];

  void _addItem(String title, String description) {
    setState(() {
      items.add(Item(title: title, description: description));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Colors.grey.shade900,
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.grey.shade200,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.grey.shade900,
          ),
          titleTextStyle: TextStyle(
            color: Colors.grey.shade900,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: Navigator(onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  scaffoldKey.currentState?.openDrawer();
                },
              ),
              backgroundColor: Colors.grey.shade200,
              centerTitle: false,
              automaticallyImplyLeading: false,
              elevation: 0.0,
              title: Padding(
                padding:const EdgeInsets.all(8.0),
                child: Text(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                  "Test App",
                  textAlign: TextAlign.left,
                ),
              ),
              titleSpacing: 0.0,
              actions: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue[900]),
                  child: TextButton.icon(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white, // Icon color
                    ),
                    label: const Text(
                      'New',
                      style: TextStyle(color: Colors.white), // Text color
                    ),
                    onPressed: () {
                      // Navigate to the add item page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddItemPage(
                            onAddItem: _addItem,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            body: MyItems(
              items: items,
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: const <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text(
                      'Test App',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
