import 'package:dydx_flutter_study_01/components/nav_link.dart';
import 'package:dydx_flutter_study_01/components/scaffold.dart';
import 'package:dydx_flutter_study_01/pages/orientation_control/landscape.dart';
import 'package:dydx_flutter_study_01/pages/orientation_control/portrait.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrientationControlPage extends StatefulWidget {
  const OrientationControlPage({Key? key}) : super(key: key);

  @override
  State<OrientationControlPage> createState() => _OrientationControlPageState();
}

class _OrientationControlPageState extends State<OrientationControlPage> {
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
    return MyScaffold(
      title: 'Orientation Control',
      child: ListView(
        children: const [
          NavigationLink(
            label: 'Portrait',
            to: PortraitPage(),
          ),
          NavigationLink(
            label: 'Landscape',
            to: LandscapePage(),
          ),
        ],
      ),
    );
  }
}
