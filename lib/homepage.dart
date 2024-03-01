import 'package:fluent_ui/fluent_ui.dart';
import 'package:flast/widgets/droptargetspace.dart';
import 'package:flast/widgets/hoverbutton.dart';
import 'package:flast/functions.dart';
import 'package:flast/variable.dart';
import 'package:get/get.dart';

variableController variablecon = variableController();

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
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 25),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: isDarkMode(context) ? Colors.white : Colors.grey,width: 0.5),
                      borderRadius: const BorderRadius.all(Radius.circular(15))
                    ),
                    child: Column(
                        children: [
                          const Text("ADB Tools",style: TextStyle(fontSize: 20)),
                          Row(
                            children: [
                              CustomHoverButton(title: "查看已连接的设备", onTap: (){
                                adbDevices();
                                showDialog(
                                  context: context,
                                  builder: (context) => ContentDialog(
                                    title: const Text('已连接的设备'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Obx(()=>
                                          Text(
                                            variablecon.connectedDevices.join('\n'),
                                            style: const TextStyle(fontSize: 18),
                                          )
                                        )
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
                              }),
                              CustomHoverButton(title: "Sideload 侧载", onTap: (){
                                showDialog(
                                  context: context,
                                  builder: (context) => ContentDialog(
                                    title: const Text('选择载入方式'),
                                    content: DropTargetSpace(
                                      onChanged: (value) {
                                        
                                      },
                                      onDragDone: (details) {
                                        
                                      },
                                    ),
                                    actions: [
                                      Button(
                                        child: const Text('确认'),
                                        onPressed: () {
                                          //TODO: 文件拖入路径后执行ADB SIDELOAD
                                          Navigator.pop(context);
                                        },
                                      ),
                                      Button(
                                        child: const Text('取消'),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ],
                                  ),
                                );
                              })
                            ],
                          ),
                          Row(
                            children: [
                              CustomHoverButton(title: "安装应用", onTap: (){
                                showDialog(
                                  context: context,
                                  builder: (context) => ContentDialog(
                                    title: const Text('选择载入方式'),
                                    content: DropTargetSpace(
                                      onChanged: (value) {
                                        
                                      },
                                      onDragDone: (details) {
                                        
                                      },
                                    ),
                                    actions: [
                                      Button(
                                        child: const Text('确认'),
                                        onPressed: () {
                                          //TODO: 文件拖入路径后执行ADB INSTALL
                                          Navigator.pop(context);
                                        },
                                      ),
                                      Button(
                                        child: const Text('取消'),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                              CustomHoverButton(title: "卸载应用（需包名）", onTap: (){
                                showDialog(
                                  context: context,
                                  builder: (context) => ContentDialog(
                                    title: const Text('卸载应用'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextBox(
                                          placeholder: "应用完整包名",
                                          onChanged: (value){
                                            variablecon.applicationPackageName.value = value;
                                          },
                                        ),
                                    ],),
                                    actions: [
                                      Button(
                                        child: const Text('确认'),
                                        onPressed: () {
                                          //TODO: 根据包名卸载
                                          Navigator.pop(context);
                                        },
                                      ),
                                      Button(
                                        child: const Text('取消'),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ],
                                  ),
                                );
                              })
                            ],
                          ),
                        ]
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    margin: const EdgeInsets.only(left: 25),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: isDarkMode(context) ? Colors.white : Colors.grey,width: 0.5),
                      borderRadius: const BorderRadius.all(Radius.circular(15))
                    ),
                    child: Column(
                        children: [
                          const Text("Fastboot Tools",style: TextStyle(fontSize: 20)),
                          Row(
                            children: [
                              CustomHoverButton(title: "查看已连接的设备", onTap: (){
                                showDialog(
                                  context: context,
                                  builder: (context) => ContentDialog(
                                    title: const Text('已连接的设备'),
                                    content: const Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [

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
                              }),
                              CustomHoverButton(title: "刷入指定分区", onTap: (){
                                showDialog(
                                  context: context,
                                  builder: (context) => ContentDialog(
                                    title: Row(
                                      children: [
                                        const Text('输入刷入的分区'),
                                        IconButton(
                                          icon: Container(
                                            margin: const EdgeInsets.only(top:5),
                                            child: const Icon(FluentIcons.info_solid,size: 28),
                                          ),
                                          onPressed: (){
                                            showDialog(
                                              context: context,
                                              builder: (context) => ContentDialog(
                                                title: const Text('分区帮助'),
                                                content: const Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text('若想刷入vbmeta，则输入 vbmeta ，以此类推。'),
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
                                        ),
                                    ],),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextBox(
                                          placeholder: "分区名",
                                          onChanged: (value){
                                            variablecon.partitionName.value = value;
                                          },
                                        ),
                                    ],),
                                    actions: [
                                      Button(
                                        child: const Text('确认'),
                                        onPressed: () {
                                          if(variablecon.partitionName.value == ""){
                                            showDialog(
                                              context: context,
                                              builder: (context) => ContentDialog(
                                                title: const Text('错误'),
                                                content: const Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text('请输入想要刷入的分区。'),
                                                  ],
                                                ),
                                                actions: [
                                                  Button(
                                                    child: const Text('关闭'),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      variablecon.partitionName.value = "";
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          }else{
                                            Navigator.pop(context);
                                            showDialog(
                                              context: context,
                                              builder: (context) => ContentDialog(
                                                title: const Text('选择载入方式'),
                                                content: DropTargetSpace(
                                                  onChanged: (value) {
                                                    //TODO: 文件拖入路径后执行FASTBOOT flash *** ***
                                                  },
                                                  onDragDone: (details) {
                                                    //TODO: 文件拖入路径后执行FASTBOOT flash *** ***
                                                  },
                                                ),
                                                actions: [
                                                  Button(
                                                    child: const Text('确认'),
                                                    onPressed: () {
                                                      //TODO: 文件拖入路径后执行FASTBOOT flash *** ***
                                                      Navigator.pop(context);
                                                      variablecon.partitionName.value = "";
                                                    },
                                                  ),
                                                  Button(
                                                    child: const Text('取消'),
                                                    onPressed: () {
                                                      variablecon.partitionName.value = "";
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                      Button(
                                        child: const Text('取消'),
                                        onPressed: () {
                                          variablecon.partitionName.value = "";
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ],
                          ),
                          Row(
                            children: [
                              CustomHoverButton(title: "重启", onTap: (){
                                showDialog(
                                  context: context,
                                  builder: (context) => ContentDialog(
                                    title: const Text('重启选项'),
                                    content: Row(
                                      children: [
                                        Button(
                                          child: const Text('Recovery'),
                                            onPressed: () {
                                              //TODO: 重启至Recovery
                                              Navigator.pop(context);
                                            },
                                        ),
                                        const SizedBox(width: 10),
                                        Button(
                                          child: const Text('System'),
                                            onPressed: () {
                                              //TODO: 重启至系统
                                              Navigator.pop(context);
                                            },
                                        ),
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
                              }),
                            ],
                          ),
                        ]
                    ),
                  ),
                ]
              ),
            ],
          ),
        ]
    );
  }
}
