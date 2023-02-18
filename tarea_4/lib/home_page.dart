import 'dart:convert';

import 'package:tarea_4/data/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var exchanges = jsonDecode(CRYPTO_EXCHANGES) as List;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto APP"),
      ),
      body: ListView.separated(
        itemCount: exchanges.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.network("${exchanges[index]["image"]}"),
            title: Text("${exchanges[index]["name"]}"),
            trailing: CircleAvatar(
              backgroundColor: Colors.black,
              child: Text("${exchanges[index]["trust_score"]}"),
            ),
            subtitle: Text(
                "${exchanges[index]["country"]} \n ${exchanges[index]["year_established"]}"),
          );
        },
      ),
    );
  }
}
