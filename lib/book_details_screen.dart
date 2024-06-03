import 'package:flutter/material.dart';


class SearchScreen extends StatefulWidget {
     String title;
   String subtitle;
   SearchScreen({ required this.title, required this.subtitle,Key ? key,}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Search List"),
        ),
      body: Expanded(
        child: ListTile(
          title: Text(widget.title),
          subtitle: Text(widget.subtitle),
        ),
      ),
       );
   }
}