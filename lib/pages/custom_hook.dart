import 'package:dydx_flutter_study_01/components/scaffold.dart';
import 'package:dydx_flutter_study_01/hooks/sample.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomHookPage extends HookWidget {
  const CustomHookPage({super.key});

  @override
  Widget build(BuildContext context) {
    // カスタムフック
    final sampleHooks = useSample();
    // 初期値
    final text = useState('no setup');

    return MyScaffold(
      title: 'Custom Hook',
      persistentFooterButtons: [
        // セットアップ
        IconButton.filled(
          color: Colors.white,
          onPressed: () {
            sampleHooks.setup('set');
          },
          icon: const Icon(Icons.settings),
        ),
        // 文字列の取得
        IconButton.filled(
          color: Colors.white,
          onPressed: () {
            text.value = sampleHooks.getValue();
          },
          icon: const Icon(Icons.abc),
        ),
      ],
      child: Center(
        // 値の表示
        child: Text(text.value, style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}
