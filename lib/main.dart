// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'items_providre.dart';
import 'sidebar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter assignment with provider',
      home: MyHomePage(),
    );
  }
}
class  MyHomePage extends StatelessWidget {
  final items = Items().items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: const Icon(Icons.data_object), 
        title: const Text('{ }  List of item'),
        actions: const [Icon(Icons.more_vert)], 
                          ),
      drawer: sidebar(), 
          floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
            // Handle add button pressed
                      },
                    ),
           floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
            final item = items[index];
     return Container(
            width: 50,
            margin: const EdgeInsets.all(10), 
            padding: const EdgeInsets.symmetric(horizontal: 0),
            decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(254, 202, 202, 202)),
            borderRadius: const BorderRadius.all(Radius.circular(10))
            ),
                child: ListTile(
                       leading: Container(
                       width: 100,
                       height: 200,
                       decoration: const BoxDecoration(
                       shape: BoxShape.circle,
                       color: Colors.blue, ),
                child: Image.network(item.imageUrl),
                          ),
              title: Text(item.name,style: const TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
              trailing: const Icon(Icons.edit,color: Color.fromARGB(255, 12, 11, 11)), 
              onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => ItemScreen(item: item),
                  ),
                );},
              )
            );},
          ),
        );
     } }
class ItemScreen extends StatelessWidget {
  final Item item;
  const ItemScreen({required this.item});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: Text(item.name),),
      body: Center(
           child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
                    Image.network(item.imageUrl),
                    const SizedBox(height: 16.0),
                    const SizedBox(height: 16.0),
              Text(
              item.description,
              style: const TextStyle(fontSize: 16.0), ),
          ], ),
        ),
      );
    } }
