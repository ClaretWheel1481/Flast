import 'package:flast/functions.dart';
import 'package:fluent_ui/fluent_ui.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => SettingsState();
}

class SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context){
    return ScaffoldPage.scrollable(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 25,bottom: 5),
              child: const Text("设置",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(left: 30),
              child: const Text("关于此应用",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.only(left: 30),
              child: const Text("Flast 0.0.1",style: TextStyle(fontSize: 13)),
            ),
            const SizedBox(height: 25),
            Container(
                padding: const EdgeInsets.only(left: 20),
                child: HyperlinkButton(
                    onPressed: (){
                      loadURL();
                    },
                    child: const Text("Github")
                )
            ),
          ],
        ),
      ]
    );
  }
}