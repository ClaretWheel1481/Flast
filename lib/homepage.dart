import 'package:fluent_ui/fluent_ui.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context){
    return ScaffoldPage.scrollable(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 25,bottom: 5),
                child: const Text("主页",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500)),
              ),
              const SizedBox(height: 20),
            ],
          )
        ]
    );
  }
}