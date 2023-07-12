
import 'package:chat/Pages/Contact/Widgets/contact_list.dart';
import 'package:chat/common/widgets/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../common/values/colors.dart';
import 'index.dart';

class ContactPage extends GetView<ContactController> {
  const ContactPage({key});

  AppBar _buildAppBar(){
    return transparentAppBar(
      title: Text("Contact",style: TextStyle(
        color: AppColors.primaryBackground,
        fontSize: 18.sp,fontWeight: FontWeight.w600,

      ),)
    );
  }
  @override
  Widget build(BuildContext context) {
    print(controller.state.contactList.length);
    return Scaffold(
       appBar: _buildAppBar(),
      body: ContactList(),
    );
  }
}
