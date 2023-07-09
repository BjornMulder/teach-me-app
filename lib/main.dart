import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'topic_provider.dart';
import 'TopicsPage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TopicProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teach Me App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TopicsPage(),
    );
  }
}
