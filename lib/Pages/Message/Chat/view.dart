
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat/Pages/Message/Chat/Widgets/chat_list.dart';
import 'package:chat/common/style/color.dart';
import 'package:chat/common/values/colors.dart';
import 'package:chat/common/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '';

import 'index.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({key});

  AppBar _buildAppBar(){
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 176, 106, 231),
              Color.fromARGB(255, 166, 112, 231),
              Color.fromARGB(255, 132, 123, 231),
              Color.fromARGB(255, 104, 132, 231),

            ],
            transform: GradientRotation(90)
            )
        ),
      ),
      title: Container(
        padding: EdgeInsets.only(top:0.w,bottom: 0.w,right: 0.w),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(top:0.w,bottom: 0.w,right: 0.w),
              child: SizedBox(
                width: 44.w,
                height: 44.w,
                child: CachedNetworkImage(
                  imageUrl: controller.state.to_avatar.value,
                  imageBuilder: (context,imageProvider)=>Container(
                    height: 44.w,
                    width: 44.w,
                    margin: null,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(44.w)),
                      image: DecorationImage(
                        image: imageProvider,fit: BoxFit.cover
                      )
                    ),
                  ),
                  errorWidget: (context,url,error)=>Image(
                    image: AssetImage('assets/images/feature-1.png'),
                  ),
                ),
              ),
            ),
            SizedBox(width: 15.w,),
            Container(
              width: 180.w,
              padding: EdgeInsets.only(top:0.w,bottom: 0.w,right: 0.w),
              child: Row(
                children: [
                  SizedBox(
                    width: 180.w,
                    height: 44.w,
                    child: GestureDetector(
                      onTap:(){

                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.state.to_name.value,
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Avenir",
                              color: AppColors.primaryBackground,
                              fontSize: 16.sp,
                            ),
                          ),
                          Obx(
                            ()=> Text(
                              controller.state.to_location.value,
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Avenir",
                                color: AppColors.primaryBackground,
                                fontSize: 16.sp,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showPicker(context){
    showModalBottomSheet(context: context, builder: (BuildContext bc){
      return SafeArea(child: Wrap(
      children: [
        ListTile(
          leading: Icon(Icons.photo_library),
          title: Text("Gallery"),
          onTap: (){
            controller.imgFromGallery();
            Get.back();
          },
        ),
        ListTile(
          leading: Icon(Icons.camera_alt),
          title: Text("Camera"),
          onTap: (){

          },
        ),
      ],
      ));
    });
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
         appBar: _buildAppBar(),
         body: SafeArea(
    child: ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        children: [
          ChatList(),
          Positioned(
              bottom: 15.h,
              height: 50.h,

              child: Container(
                width: 360.w,
                height: 50.h,
                color: AppColors.primaryBackground,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 210.w,
                      height: 50.h,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        controller: controller.textController,
                        autofocus: false,
                        focusNode: controller.contentNode,
                        decoration: InputDecoration(
                          hintText: "Send Message..."
                        ),
                      ),
                    ),
                  Container(
                    height: 35.h,
                    width: 35.h,
                    margin: EdgeInsets.only(left: 5.w),
                    child: GestureDetector(
                      child: new Icon(
                        Icons.photo_album_outlined,
                        size: 35.w,
                        color: Colors.blue,
                      ),
                      onTap: (){
                        _showPicker(context);
                      },
                    ),
                  ),
                    Container(
                      margin: EdgeInsets.only(left: 10.w,top: 5.h),
                      width: 65.w,
                      height: 35.h,
                      child: ElevatedButton(
                        child: Text("Send"),
                        onPressed: (){
                          controller.sendMessage();

                        },
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    ),
    )
    );
  }
}
