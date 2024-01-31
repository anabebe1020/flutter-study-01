import 'package:flutter_hooks/flutter_hooks.dart';

// Sampleクラスを返すカスタムフック
Sample useSample() {
  // hooks
  final setupValue = useState<String?>(null);

  void setup(String value) {
    setupValue.value = value;
  }

  String getValue() {
    return setupValue.value ?? 'none';
  }

  return Sample(
    setup: setup,
    getValue: getValue,
  );
}

// カスタムフックで返したいクラス
class Sample {
  final void Function(String) setup;
  final String Function() getValue;

  Sample({required this.setup, required this.getValue});
}
