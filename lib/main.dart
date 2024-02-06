import 'package:flutter/material.dart';
import 'package:flast/start.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  runApp(MyApp());

  doWhenWindowReady(() {
    appWindow.minSize = Size(1080,680);
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}
