
import 'package:chat/Pages/Application/controller.dart';
import 'package:chat/Pages/Contact/controller.dart';
import 'package:chat/Pages/Message/controller.dart';
import 'package:get/get.dart';

import '../Profile/controller.dart';


class ApplicationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() =>ApplicationController());
    Get.lazyPut<ContactController>(() =>ContactController());
    Get.lazyPut<MessageController>(() =>MessageController());
    Get.lazyPut<ProfileController>(() =>ProfileController());

  }

}