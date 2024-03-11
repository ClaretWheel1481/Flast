import 'package:flast/functions.dart';
import 'package:flast/pages/homepage.dart';
import 'package:fluent_ui/fluent_ui.dart';

class Apps extends StatefulWidget {
  const Apps({super.key});

  @override
  State<Apps> createState() => AppsState();
}

class AppsState extends State<Apps> {

  @override
  Widget build(BuildContext context){
    return ScaffoldPage.scrollable(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 25,bottom: 5),
              child: const Text("进程管理",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 25,right: 5),
                  child: FilledButton(
                    child: const Text("开启监测"), 
                    onPressed: (){
                      adbGetAllApps();
                      if(variableCtrl.OutputLog.value.compareTo("adb.exe: no devices/emulators found") == 1){
                        showCustomDialog(variableCtrl.OutputLog.value);
                      }
                      //TODO:实时监测待处理
                    }
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 25,right: 15),
                  child: Button(
                    child: const Text("停止监测"), 
                    onPressed: (){
                      //TODO:监测停止待处理
                    }
                  ),
                ),
              ],
            )
          ],
        ),
      ]
    );
  }

  void showCustomDialog(String output){
    showDialog(
      context: context, 
      builder: (context) => ContentDialog(
        title: const Text('通知'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(output,style: const TextStyle(fontSize: 18),)
          ],
        ),
        actions: [
          Button(
            child: const Text('关闭'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}