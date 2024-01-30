import 'package:dydx_flutter_study_01/components/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LandscapePage extends StatefulWidget {
  const LandscapePage({Key? key}) : super(key: key);

  @override
  State<LandscapePage> createState() => _LandscapePageState();
}

class _LandscapePageState extends State<LandscapePage> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      // 左方向を許可する
      DeviceOrientation.landscapeLeft,
      // 右方向を許可する
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      // 左方向を許可する
      DeviceOrientation.landscapeLeft,
      // 上方向を許可する
      DeviceOrientation.portraitUp,
      // 右方向を許可する
      DeviceOrientation.landscapeRight,
      // 下方向を許可する
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      title: 'Portrait',
      child: Center(
        child: Text('横方向のみ', style: TextStyle(fontSize: 24.0)),
      ),
    );
  }
}
