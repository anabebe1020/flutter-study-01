import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  final String title;
  final Widget child;
  final List<Widget>? persistentFooterButtons;

  const MyScaffold({
    super.key,
    required this.title,
    required this.child,
    this.persistentFooterButtons,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        foregroundColor: Colors.white,
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: child,
      persistentFooterButtons: persistentFooterButtons,
    );
  }
}
