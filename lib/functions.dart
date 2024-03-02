import 'package:url_launcher/url_launcher.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:process_run/process_run.dart';
import 'dart:convert';
import 'package:flast/homepage.dart';
import 'dart:io';

//不同系统的adb工具路径
//TODO:构建时需修改
// const windowsAdbPath = "data/flutter_assets/assets/tools/windows/adb.exe";
// const linuxAdbPath = "data/flutter_assets/assets/tools/linux/adb.exe";

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
  variableCtrl.connectedDevices.clear();
  final result = await run('$adbPath "devices"');
  final output = utf8.decode(utf8.encode(result[0].stdout));
  final lines = output.trim().split('\n');
  variableCtrl.connectedDevices.addAll(lines.sublist(1));
}

//adb uninstall ***命令执行方法
Future adbUninstall() async{
  var output = "";
  //根据系统不同更换工具路径
  var adbPath = "";
  if (Platform.isLinux) {
    adbPath = linuxAdbPath;
  } else if (Platform.isWindows) {
    adbPath = windowsAdbPath;
  }
  final result = await run('$adbPath "uninstall" ${variableCtrl.uninstallApplicationPackageName.value}',throwOnError: false);
  output = utf8.decode(utf8.encode(result[0].stdout));
  if(result[0].stdout == ""){
    output = utf8.decode(utf8.encode(result[0].stderr));
  }else{
    output = utf8.decode(utf8.encode(result[0].stdout));
  }
  print(output);
  if(output == "Success"){
    //TODO:功能实现后反馈待处理
  }else{
    //TODO:功能未实现错误反馈待处理 
  }
}

//adb install ***命令执行方法
Future adbInstall() async{
  var output = "";
  //根据系统不同更换工具路径
  var adbPath = "";
  if (Platform.isLinux) {
    adbPath = linuxAdbPath;
  } else if (Platform.isWindows) {
    adbPath = windowsAdbPath;
  }
  final result = await run('$adbPath "install" ${variableCtrl.installApplicationPackageName}',throwOnError: false);
  output = utf8.decode(utf8.encode(result[0].stdout));
  if(result[0].stdout == ""){
    output = utf8.decode(utf8.encode(result[0].stderr));
  }else{
    output = utf8.decode(utf8.encode(result[0].stdout));
  }
  print(output);
  if(output == "Success"){
    //TODO:功能实现后反馈待处理
  }else{
    //TODO:功能未实现错误反馈待处理 
  }
}

//adb sideload ***命令执行方法
Future adbSideload() async{
  var output = "";
  //根据系统不同更换工具路径
  var adbPath = "";
  if (Platform.isLinux) {
    adbPath = linuxAdbPath;
  } else if (Platform.isWindows) {
    adbPath = windowsAdbPath;
  }
  final result = await run('$adbPath "sideload" ${variableCtrl.adbSideloadFilePath}',throwOnError: false);
  if(result[0].stdout == ""){
    output = utf8.decode(utf8.encode(result[0].stderr));
  }else{
    output = utf8.decode(utf8.encode(result[0].stdout));
  }
  print(output);
  if(output == "Success"){
    //TODO:功能实现后反馈待处理
  }else{
    //TODO:功能未实现错误反馈待处理 
  }
}