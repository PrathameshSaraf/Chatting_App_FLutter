
import 'package:chat/Pages/Message/Chat/index.dart';
import 'package:chat/Pages/Message/photoView/binding.dart';
import 'package:chat/Pages/Message/photoView/index.dart';
import 'package:chat/common/middlewares/middlewares.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Pages/Application/index.dart';

import '../../Pages/Contact/index.dart';
import '../../Pages/Profile/binding.dart';
import '../../Pages/Profile/view.dart';
import '../../Pages/SignIn/index.dart';
import '../../Pages/Welcome/index.dart';
import 'routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static const APPlication = AppRoutes.Application;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [

    GetPage(
      name: AppRoutes.INITIAL,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
      middlewares: [
        RouteWelcomeMiddleware(priority: 1)
      ]
    ),

    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => SignInPage(),
      binding: SignInBinding(),
    ),

    // check if needed to login or not
    GetPage(
      name: AppRoutes.Application,
      page: () => ApplicationPage(),
      binding: ApplicationBinding(),
      middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],
    ),

    GetPage(name: AppRoutes.Contact, page: () => ContactPage(), binding: ContactBinding()),

    GetPage(name: AppRoutes.Chat, page: () => ChatPage(), binding: ChatBinding()),
    GetPage(name: AppRoutes.Photoimgview, page: () => PhotoImageView(), binding: PhotoImageViewBinding()),
    GetPage(name: AppRoutes.Me, page: () => ProfilePage(), binding: ProfileBinding()),
 /*   //消息
    GetPage(name: AppRoutes.Message, page: () => MessagePage(), binding: MessageBinding()),
    //我的

    //聊天详情


   */
  ];






}
