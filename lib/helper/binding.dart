import 'package:get/get.dart';
import 'package:medicalapp/core/controller/OrderController.dart';
import 'package:medicalapp/helper/lang/langController.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderController(), permanent: true);
    Get.lazyPut(() => LangController());
  }
}
