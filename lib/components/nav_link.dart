import 'package:dydx_flutter_study_01/utils/transition.dart';
import 'package:flutter/material.dart';

class NavigationLink extends StatelessWidget {
  final String label;
  final Widget to;
  const NavigationLink({super.key, required this.label, required this.to});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        push(context, to, to.runtimeType);
      },
      child: Text(label, style: const TextStyle(fontSize: 24.0)),
    );
  }
}
