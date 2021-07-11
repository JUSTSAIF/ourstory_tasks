import 'package:get/get.dart';
import 'package:todo/controllers/authController.dart';
import 'package:todo/controllers/todoController.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(TodoController());
  }
}
