import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tech_task/domain/models/ingredient.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tech Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Tech Task'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<IngredientModel> _ingredientList = [];

  Future<void> _incrementCounter() async {
    final response = await http.get(Uri.parse(
        'https://lb7u7svcm5.execute-api.ap-southeast-1.amazonaws.com/dev/ingredients'));
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      final responselist = decodedResponse as List;
      _ingredientList =
          responselist.map((e) => IngredientModel.fromMap(e)).toList();
      // log('Response $responselist');
      log('Response $_ingredientList');
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: _ingredientList
              .map(
                (e) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name - ${e.title}'),
                    Text('Best Before - ${e.useBy}'),
                  ],
                ),
              )
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
