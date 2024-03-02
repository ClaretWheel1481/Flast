import 'package:url_launcher/url_launcher.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:process_run/process_run.dart';
import 'dart:convert';
import 'package:flast/homepage.dart';
import 'dart:io';

//不同系统的工具路径

//TODO:构建时需修改

// const windowsAdbPath = "data/flutter_assets/assets/tools/windows/adb.exe";
// const linuxAdbPath = "data/flutter_assets/assets/tools/linux/adb.exe";
// const windowsFastbootPath = "data/flutter_assets/assets/tools/windows/fastboot.exe";
// const linuxFastbootPath = "data/flutter_assets/assets/tools/linux/fastboot";

const windowsAdbPath = "assets/tools/windows/adb.exe";
const linuxAdbPath = "assets/tools/linux/adb";
const windowsFastbootPath = "assets/tools/windows/fastboot.exe";
const linuxFastbootPath = "assets/tools/linux/fastboot";

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
  variableCtrl.adbConnectedDevices.clear();
  final result = await run('$adbPath "devices"');
  final output = utf8.decode(utf8.encode(result[0].stdout));
  final lines = output.trim().split('\n');
  variableCtrl.adbConnectedDevices.addAll(lines.sublist(1));
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
  variableCtrl.uninstallOutput.value = output;
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
  variableCtrl.installOutput.value = output;
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
  variableCtrl.sideloadOutput.value = output;
}

//adb reboot ***命令执行方法
Future adbReboot(String partion) async{
  //根据系统不同更换工具路径
  var adbPath = "";
  if (Platform.isLinux) {
    adbPath = linuxAdbPath;
  } else if (Platform.isWindows) {
    adbPath = windowsAdbPath;
  }
  await run('$adbPath "reboot" $partion',throwOnError: false);
}

//FASTBOOT DEVICES命令执行方法
Future fbDevices() async{
  //根据系统不同更换工具路径
  var fbPath = "";
  if (Platform.isLinux) {
    fbPath = linuxFastbootPath;
  } else if (Platform.isWindows) {
    fbPath = windowsFastbootPath;
  }
  //执行FASTBOOT DEVICES
  variableCtrl.fbConnectedDevices.clear();
  final result = await run('$fbPath "devices"');
  final output = utf8.decode(utf8.encode(result[0].stdout));
  final lines = output.trim().split('\n');
  variableCtrl.fbConnectedDevices.addAll(lines);
}

//FASTBOOT FLASH ** **命令执行方法
Future fbFlashFile() async{
  var output = "";
  //根据系统不同更换工具路径
  var fbPath = "";
  if (Platform.isLinux) {
    fbPath = linuxFastbootPath;
  } else if (Platform.isWindows) {
    fbPath = windowsFastbootPath;
  }
  final result = await run('$fbPath "flash" ${variableCtrl.partitionName} ${variableCtrl.fbFlashFilePath}',throwOnError: false);
  if(result[0].stdout == ""){
    output = utf8.decode(utf8.encode(result[0].stderr));
  }else{
    output = utf8.decode(utf8.encode(result[0].stdout));
  }
  variableCtrl.fbFlashOutput.value = output;
}

//fastboot reboot ***命令执行方法
Future fbReboot(String partion) async{
  //根据系统不同更换工具路径
  var fbPath = "";
  if (Platform.isLinux) {
    fbPath = linuxFastbootPath;
  } else if (Platform.isWindows) {
    fbPath = windowsFastbootPath;
  }
  await run('$fbPath "reboot" $partion',throwOnError: false);
}