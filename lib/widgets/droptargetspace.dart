import 'package:fluent_ui/fluent_ui.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:flast/functions.dart';

//自定义DropTargetSpace

class DropTargetSpace extends StatefulWidget {
  final OnDragDoneCallback onDragDone;
  final ValueChanged<String> onChanged;

  const DropTargetSpace({super.key, required this.onDragDone, required this.onChanged});

  @override
  // ignore: library_private_types_in_public_api
  _DropTargetSpaceState createState() => _DropTargetSpaceState();
}

class _DropTargetSpaceState extends State<DropTargetSpace> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DropTarget(
          onDragDone:(details) {
            widget.onDragDone(details);
            Navigator.pop(context);
          },
          child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: isDarkMode(context) ? Colors.white : Colors.grey,width: 0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(15))
                ),
                constraints: const BoxConstraints(maxHeight: 200),
                padding: const EdgeInsets.all(5),
                child: const Center(child: Text("拖入文件",style: TextStyle(fontSize: 20))),
              ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: const Text("OR")
        ),
        TextBox(
          placeholder: "文件完整路径",
          onChanged: (value){
            widget.onChanged(value);
          },
        ),
    ],);
  }
}