import 'package:flutter/material.dart';
import 'package:flast/start.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  runApp(const MyApp());

  //启动时设置窗口大小
  doWhenWindowReady(() {
    appWindow.minSize = const Size(1280,720);
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}
