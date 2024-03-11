import 'package:flast/pages/apps.dart';
import 'package:flast/pages/homepage.dart';
import 'package:flast/pages/settings.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  int selectedIndex = 0;  //用于页面跳转

  final List<NavigationPaneItem> panelItems = [
    PaneItemSeparator(),
    PaneItem(
      icon: const Icon(FluentIcons.home),
      title: const Text("主页"),
      body: const Homepage(),
    ),
    PaneItem(
      icon: const Icon(FluentIcons.all_apps),
      title: const Text("进程管理"),
      body: const Apps(),
    ),
    PaneItem(
      icon: const Icon(FluentIcons.settings),
      title: const Text("设置"),
      body: const Settings(),
    ),
  ];

  @override
  Widget build(BuildContext context){
    return NavigationView(
      appBar: NavigationAppBar(
        title: const Text("Flast",style: TextStyle(fontSize: 18)),
        automaticallyImplyLeading: false,
        height: 40,
        actions: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: MoveWindow(),
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: MinimizeWindowButton(),
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: MaximizeWindowButton(),
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: CloseWindowButton(),
            ),
          ],
        )
      ),
      pane: NavigationPane(
        displayMode: PaneDisplayMode.compact,
        items: panelItems,
        size: const NavigationPaneSize(
          openWidth: 150
        ),
        onChanged: (index) => setState(() {
          selectedIndex = index;
        }),
        selected: selectedIndex,
      ),
    );
  }
}