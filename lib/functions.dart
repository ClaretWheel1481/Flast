import 'package:url_launcher/url_launcher.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:process_run/process_run.dart';
import 'dart:convert';
import 'package:flast/homepage.dart';
import 'dart:io';

const windowsAdbPath = "assets/tools/windows/adb.exe";
const linuxAdbPath = "assets/tools/linux/adb.exe";

Future loadURL() async{
  if (await canLaunchUrl(Uri.parse('https://github.com/ClaretWheel1481/Flast'))){
    await launchUrl(Uri.parse('https://github.com/ClaretWheel1481/Flast'));
  }
}

bool isDarkMode(BuildContext context) {
  return FluentTheme.of(context).brightness == Brightness.dark;
}

Future adbDevices() async{ 
  var adbPath = "";
  if (Platform.isLinux) {
    adbPath = linuxAdbPath;
  } else if (Platform.isWindows) {
    adbPath = windowsAdbPath;
  }
  variablecon.connectedDevices.clear();
  final result = await run('$adbPath "devices"');
  final output = utf8.decode(utf8.encode(result[0].stdout));
  final lines = output.trim().split('\n');
  variablecon.connectedDevices.addAll(lines.sublist(1));
}

