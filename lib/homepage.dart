import 'package:fluent_ui/fluent_ui.dart';
import 'package:flast/widgets/droptargetspace.dart';
import 'package:flast/widgets/hoverbutton.dart';

bool isDarkMode(BuildContext context) {
  return FluentTheme.of(context).brightness == Brightness.dark;
}

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
                                    //TODO: 文件拖入路径后执行ADB SIDELOAD
                                    actions: [
                                      Button(
                                        child: const Text('确认'),
                                        onPressed: () => Navigator.pop(context),
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
                                    //TODO: 文件拖入路径后执行ADB INSTALL
                                    actions: [
                                      Button(
                                        child: const Text('确认'),
                                        onPressed: () => Navigator.pop(context),
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

                                          },
                                        ),
                                    ],),
                                    //TODO: 根据包名卸载
                                    actions: [
                                      Button(
                                        child: const Text('确认'),
                                        onPressed: () => Navigator.pop(context),
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
                                  CustomHoverButton(title: "刷入Recovery", onTap: (){
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
                                        //TODO: 执行FASTBOOT flash recovery ...
                                        actions: [
                                          Button(
                                            child: const Text('确认'),
                                            onPressed: () => Navigator.pop(context),
                                          ),
                                          Button(
                                            child: const Text('取消'),
                                            onPressed: () => Navigator.pop(context),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                  CustomHoverButton(title: "刷入Boot", onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (context) => ContentDialog(
                                        title: const Text('选择分区'),
                                        content: Row(children: [
                                          Button(
                                            child: const Text('正常刷入'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              showDialog(
                                                context: context,
                                                builder: (context) => ContentDialog(
                                                  title: const Text('选择载入方式 Default'),
                                                  content: DropTargetSpace(
                                                    onChanged: (value) {
                                                      
                                                    },
                                                    onDragDone: (details) {
                                                      
                                                    },
                                                  ),
                                                  //TODO: 文件拖入路径后执行FASTBOOT flash boot ...
                                                  actions: [
                                                    Button(
                                                      child: const Text('确认'),
                                                      onPressed: () => Navigator.pop(context),
                                                    ),
                                                    Button(
                                                      child: const Text('取消'),
                                                      onPressed: () => Navigator.pop(context),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                          const SizedBox(width: 5),
                                          Button(
                                            child: const Text('A分区'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              showDialog(
                                                context: context,
                                                builder: (context) => ContentDialog(
                                                  title: const Text('选择载入方式 boot_a'),
                                                  content: DropTargetSpace(
                                                    onChanged: (value) {
                                                      
                                                    },
                                                    onDragDone: (details) {
                                                      
                                                    },
                                                  ),
                                                  //TODO: 文件拖入路径后执行FASTBOOT flash boot_a ...
                                                  actions: [
                                                    Button(
                                                      child: const Text('确认'),
                                                      onPressed: () => Navigator.pop(context),
                                                    ),
                                                    Button(
                                                      child: const Text('取消'),
                                                      onPressed: () => Navigator.pop(context),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                          ),
                                          const SizedBox(width: 5),
                                          Button(
                                            child: const Text('B分区'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              showDialog(
                                                context: context,
                                                builder: (context) => ContentDialog(
                                                  title: const Text('选择载入方式 boot_b'),
                                                  content: DropTargetSpace(
                                                    onChanged: (value) {
                                                      
                                                    },
                                                    onDragDone: (details) {
                                                      
                                                    },
                                                  ),
                                                  //TODO: 文件拖入路径后执行FASTBOOT flash boot_b ...
                                                  actions: [
                                                    Button(
                                                      child: const Text('确认'),
                                                      onPressed: () => Navigator.pop(context),
                                                    ),
                                                    Button(
                                                      child: const Text('取消'),
                                                      onPressed: () => Navigator.pop(context),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ],),
                                        //TODO: 执行FASTBOOT flash recovery ...
                                        actions: [
                                          Button(
                                            child: const Text('确认'),
                                            onPressed: () => Navigator.pop(context),
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
                                  CustomHoverButton(title: "重启至Recovery", onTap: (){}),
                                  CustomHoverButton(title: "重启至系统", onTap: (){})
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
