
import 'package:chat/Pages/Message/photoView/controller.dart';
import 'package:get/get.dart';


class PhotoImageViewBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PhotoImageViewController>(() => PhotoImageViewController());
  }

}