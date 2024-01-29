import 'package:flutter/material.dart';

void replace(BuildContext context, Widget to, Type meta) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => to,
      settings: RouteSettings(name: meta.toString()),
    ),
  );
}

void root(BuildContext context, Widget to, Type meta) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(
      builder: (BuildContext context) => to,
      settings: RouteSettings(name: meta.toString()),
    ),
    ModalRoute.withName('/home'),
  );
}

Future<void> push(BuildContext context, Widget to, Type meta) async {
  await Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => to,
      settings: RouteSettings(name: meta.toString()),
    ),
  );
}

Future<void> modal(BuildContext context, Widget to, Type meta) async {
  await Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => to,
      settings: RouteSettings(name: meta.toString()),
      fullscreenDialog: true,
    ),
  );
}
