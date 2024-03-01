import 'package:url_launcher/url_launcher.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:process_run/process_run.dart';
import 'dart:convert';
import 'package:flast/homepage.dart';
import 'dart:io';

//不同系统的adb工具路径
const windowsAdbPath = "assets/tools/windows/adb.exe";
const linuxAdbPath = "assets/tools/linux/adb.exe";

//点击跳转Github
Future loadURL() async{
  if (await canLaunchUrl(Uri.parse('https://github.com/ClaretWheel1481/Flast'))){
    await launchUrl(Uri.parse('https://github.com/ClaretWheel1481/Flast'));
  }
}

//检测当前主题颜色
bool isDarkMode(BuildContext context) {
  return FluentTheme.of(context).brightness == Brightness.dark;
}


//adb devices命令执行方法
Future adbDevices() async{ 
  //根据系统不同更换工具路径
  var adbPath = "";
  if (Platform.isLinux) {
    adbPath = linuxAdbPath;
  } else if (Platform.isWindows) {
    adbPath = windowsAdbPath;
  }
  //执行ADB DEVICES
  variablecon.connectedDevices.clear();
  final result = await run('$adbPath "devices"');
  final output = utf8.decode(utf8.encode(result[0].stdout));
  final lines = output.trim().split('\n');
  variablecon.connectedDevices.addAll(lines.sublist(1));
}

Future adbUninstall() async{
  //根据系统不同更换工具路径
  var adbPath = "";
  if (Platform.isLinux) {
    adbPath = linuxAdbPath;
  } else if (Platform.isWindows) {
    adbPath = windowsAdbPath;
  }
  final result = await run('$adbPath "uninstall" ${variablecon.uninstallApplicationPackageName}');
  final output = utf8.decode(utf8.encode(result[0].stdout));
  if(output == "Success"){
    //TODO:功能实现后反馈待处理
  }
}

Future adbInstall() async{
  //根据系统不同更换工具路径
  var adbPath = "";
  if (Platform.isLinux) {
    adbPath = linuxAdbPath;
  } else if (Platform.isWindows) {
    adbPath = windowsAdbPath;
  }
  final result = await run('$adbPath "install" ${variablecon.installApplicationPackageName}');
  final output = utf8.decode(utf8.encode(result[0].stdout));
  if(output == "Success"){
    //TODO:功能实现后反馈待处理
  }
}