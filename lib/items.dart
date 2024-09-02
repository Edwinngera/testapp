import 'package:flutter/material.dart';
import 'package:testapp/itemcard.dart';
import 'package:testapp/models/itemmodel.dart';

class MyItems extends StatefulWidget {
  const MyItems({super.key, required this.items});

  final List<Item> items;

  @override
  State<MyItems> createState() => _MyItemsState();
}

class _MyItemsState extends State<MyItems> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return ItemCard(
            title: widget.items[index].title!,
            description: widget.items[index].description!,
            onDelete: () {
              setState(() {
                widget.items.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }
}
