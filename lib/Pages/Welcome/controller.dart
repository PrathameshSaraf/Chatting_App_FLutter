import 'package:chat/Pages/Welcome/state.dart';
import 'package:chat/common/routes/names.dart';
import 'package:get/get.dart';

import '../../common/store/config.dart';

class WelcomeController extends GetxController{

  final title="Chat .";
  final state =WelcomeState();
  WelcomeController();
  changePage(int index)async{
    state.index.value=index;
    print(index);
  }

  handleSignIn() async {
    await ConfigStore.to.saveAlreadyOpen();
    Get.offAndToNamed(
      AppRoutes.SIGN_IN
    );
  }

}