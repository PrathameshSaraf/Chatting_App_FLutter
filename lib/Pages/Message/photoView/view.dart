import 'package:chat/Pages/Message/photoView/controller.dart';
import 'package:chat/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class PhotoImageView extends GetView<PhotoImageViewController> {
  const PhotoImageView({super.key});

  AppBar _buildAppbar(){
    return AppBar(
      bottom: PreferredSize(
        child: Container(
          color: AppColors.secondaryElement,
          height: 2.0,

        ),
        preferredSize: Size.fromHeight(1.0),
      ),
      title: Text("Photoview",style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: Container(
        child: PhotoView(
          imageProvider: NetworkImage(controller.state.url.value),
        ),
      ),
    );
  }
}
