import 'package:flutter/material.dart';
import 'package:flast/start.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  runApp(const MyApp());

  doWhenWindowReady(() {
    appWindow.minSize = const Size(960,680);
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}
