import 'package:get/get.dart';

class VariableController extends GetxController {
  List<dynamic> adbConnectedDevices = [

  ].obs;

  List<dynamic> fbConnectedDevices = [

  ].obs;
  
  var partitionName = "".obs;
  var uninstallApplicationPackageName = "".obs;
  var installApplicationPackageName = "".obs;
  var adbSideloadFilePath = "".obs;
  var fbFlashFilePath = "".obs;

  var uninstallOutput = "".obs;
  var installOutput = "".obs;
  var sideloadOutput = "".obs;
  var fbFlashOutput = "".obs;
}






