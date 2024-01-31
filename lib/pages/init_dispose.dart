import 'package:dydx_flutter_study_01/components/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class InitializeDisposePage extends HookWidget {
  const InitializeDisposePage({super.key});

  void dispose() {
    print('dispose処理');
  }

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      print('init処理');
      return dispose;
    }, const []);

    return const MyScaffold(
      title: 'Init Dispose for HookWidget',
      child: Center(
        child: Text('', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
