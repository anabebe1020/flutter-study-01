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
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
