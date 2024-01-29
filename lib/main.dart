import 'package:dydx_flutter_study_01/components/scaffold.dart';
import 'package:dydx_flutter_study_01/pages/union_type.dart';
import 'package:dydx_flutter_study_01/utils/transition.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: 'トップ',
      child: ListView(
        children: [
          TextButton(
            onPressed: () {
              push(context, const TypeProcessingView(), TypeProcessingView);
            },
            child: const Text(
              'Union Type',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
        ],
      ),
    );
  }
}
