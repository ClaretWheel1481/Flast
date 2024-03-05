import 'package:flast/functions.dart';
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
}