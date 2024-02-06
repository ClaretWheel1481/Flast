import 'package:fluent_ui/fluent_ui.dart';
import 'home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Flast',
      home: Home(),
      theme: FluentThemeData(
        brightness: Brightness.light,
        fontFamily: "MSYH",
        accentColor: Colors.blue
      ),
      darkTheme: FluentThemeData(
        brightness: Brightness.dark,
        fontFamily: "MSYH",
        accentColor: Colors.blue
      ),
    );
  }
}