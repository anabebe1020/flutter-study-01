import 'package:dydx_flutter_study_01/components/scaffold.dart';
import 'package:dydx_flutter_study_01/pages/custom_hook.dart';
import 'package:dydx_flutter_study_01/pages/init_dispose.dart';
import 'package:dydx_flutter_study_01/pages/orientation_change.dart';
import 'package:dydx_flutter_study_01/pages/orientation_control/page.dart';
import 'package:dydx_flutter_study_01/pages/union_type.dart';
import 'package:flutter/material.dart';

import 'components/nav_link.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        children: const [
          NavigationLink(
            label: 'Union Type',
            to: TypeProcessingView(),
          ),
          NavigationLink(
            label: 'Orientation Control',
            to: OrientationControlPage(),
          ),
          //
          NavigationLink(
            label: 'Orientation Change',
            to: OrientationChangePage(),
          ),
          NavigationLink(
            label: 'Custom Hook',
            to: CustomHookPage(),
          ),
          NavigationLink(
            label: 'Init Dispose for HookWidget',
            to: InitializeDisposePage(),
          ),
        ],
      ),
    );
  }
}
