import 'package:get/get.dart';

class VariableController extends GetxController {
  List<dynamic> adbConnectedDevices = [

  ].obs;

  List<dynamic> fbConnectedDevices = [

  ].obs;

  List<dynamic> systemAllApps = [

  ].obs;
  
  var partitionName = "".obs;   //刷入的分区名称
  var uninstallApplicationPackageName = "".obs;   //卸载的包名
  var installApplicationPackageName = "".obs;   //安装的包名
  var adbSideloadFilePath = "".obs;   //Sideload文件路径
  var fbFlashFilePath = "".obs;   //Fastboot刷入的分区的文件路径

  var OutputLog = "".obs;   //输出
}






