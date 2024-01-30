import 'package:dydx_flutter_study_01/components/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrientationChangePage extends StatefulWidget {
  const OrientationChangePage({Key? key}) : super(key: key);

  @override
  State<OrientationChangePage> createState() => _OrientationChangePageState();
}

class _OrientationChangePageState extends State<OrientationChangePage> {
  @override
  void initState() {
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// 現在の画面方向を知る
    final currentOrientation = MediaQuery.of(context).orientation;
    print(currentOrientation);

    return MyScaffold(
      title: 'Orientation Change',
      child: LayoutBuilder(
        builder: (context, constraints) {
          /// 画面サイズ 縦より横の方が大きければ横方向とする
          if (constraints.maxWidth > constraints.maxHeight) {
            return const Center(
              child: Text(
                '横方向',
                style: TextStyle(fontSize: 24.0),
              ),
            );
          }

          /// 縦方向とする
          return const Center(
            child: Text(
              '縦方向',
              style: TextStyle(fontSize: 24.0),
            ),
          );
        },
      ),
    );
  }
}
