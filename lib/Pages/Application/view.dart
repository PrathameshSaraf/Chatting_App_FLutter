
import 'package:chat/Pages/Contact/index.dart';
import 'package:chat/Pages/Message/view.dart';
import 'package:chat/Pages/Profile/index.dart';
import 'package:chat/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'index.dart';

class ApplicationPage extends GetView<ApplicationController> {
  const ApplicationPage({key});

 Widget _buildPageView(){
   return PageView(
     physics: NeverScrollableScrollPhysics(),
     controller: controller.pageController,
     onPageChanged: controller.handPageChanged,
     children: const[
       MessagePage(),
       ContactPage(),
      ProfilePage(),
     ],
   );
 }

 Widget _buildBottomNavigationBar(){
   return Obx(() => BottomNavigationBar(
     items: controller.bottomTabs,
     currentIndex: controller.state.page,
      type:BottomNavigationBarType.fixed,
     onTap:   controller.handleNavBarTap,
     showSelectedLabels: true,
     showUnselectedLabels: true,
     unselectedItemColor: AppColors.tabBarElement,
     selectedItemColor: AppColors.thirdElementText,
   ));
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
