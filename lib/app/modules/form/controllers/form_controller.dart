import 'package:get/get.dart';

class FormController extends GetxController {
  RxString imagePath = RxString('');

  void setImage(String imagePath) {
    this.imagePath.value = imagePath;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
