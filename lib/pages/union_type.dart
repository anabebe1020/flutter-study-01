import 'package:dydx_flutter_study_01/components/scaffold.dart';
import 'package:flutter/material.dart';

/// Union type
sealed class SampleUnionType {
  const SampleUnionType._(this.value);

  const factory SampleUnionType.string(String value) = TypeA;
  const factory SampleUnionType.number(num value) = TypeB;

  final dynamic value;
}

class TypeA extends SampleUnionType {
  const TypeA(String super.value) : super._();

  @override
  String get value => super.value;
}

class TypeB extends SampleUnionType {
  const TypeB(num super.value) : super._();

  @override
  num get value => super.value;
}

/// View
class TypeProcessingView extends StatefulWidget {
  const TypeProcessingView({Key? key}) : super(key: key);

  @override
  State<TypeProcessingView> createState() => _TypeProcessingViewState();
}

class _TypeProcessingViewState extends State<TypeProcessingView> {
  SampleUnionType? sampleType;

  /// 型を返す
  String getType(SampleUnionType? type) {
    if (type is TypeA) {
      // ここでTypeAとして認識される
      final typeA = type;
      return typeA.runtimeType.toString();
    }
    if (type is TypeB) {
      // ここでTypeBとして認識される
      final typeB = type;
      return typeB.runtimeType.toString();
    }
    return 'unknown';
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: 'Union Type',
      persistentFooterButtons: [
        /// TypeA型をセットする
        IconButton.filled(
          color: Colors.white,
          onPressed: () {
            setState(() {
              sampleType = const TypeA('value');
            });
          },
          icon: const Icon(Icons.abc),
        ),

        /// TypeB型をセットする
        IconButton.filled(
          color: Colors.white,
          onPressed: () {
            setState(() {
              sampleType = const TypeB(0);
            });
          },
          icon: const Icon(Icons.numbers),
        ),

        /// nullをセットする
        IconButton.filled(
          color: Colors.white,
          onPressed: () {
            setState(() {
              sampleType = null;
            });
          },
          icon: const Icon(Icons.clear),
        ),
      ],
      child: Center(
        child: Text(
          getType(sampleType),
          style: const TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
