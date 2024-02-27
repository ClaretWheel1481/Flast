import 'package:url_launcher/url_launcher.dart';
import 'package:fluent_ui/fluent_ui.dart';

Future loadURL() async{
  if (await canLaunchUrl(Uri.parse('https://github.com/ClaretWheel1481/Flast'))){
    await launchUrl(Uri.parse('https://github.com/ClaretWheel1481/Flast'));
  }
}

bool isDarkMode(BuildContext context) {
  return FluentTheme.of(context).brightness == Brightness.dark;
}