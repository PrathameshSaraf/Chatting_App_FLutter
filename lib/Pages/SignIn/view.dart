
import 'package:chat/common/style/color.dart';
import 'package:chat/common/values/colors.dart';
import 'package:chat/common/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '';
import '../../common/values/shadows.dart';
import 'index.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({key});


  @override
  Widget build(BuildContext context) {

    Widget _buildLogo(){
      return Container(
        width: 110.w,
        margin: EdgeInsets.only(
        top: 84.h,),
        child: Column(
          children: [
            Container(
              width: 76.w,
                height: 76.w,
              margin: EdgeInsets.only(
                top: 15.h,),
              child: Stack(
                children: [
                  Positioned(child: Container(
                    height: 76.w,
                    decoration: const BoxDecoration(
                      color:AppColors.primaryBackground,
                      boxShadow: [
                        Shadows.primaryShadow,
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(35))
                    ),
                  )),
                  Positioned(child: Image.asset(
                    "assets/images/ic_launcher.png",
                    width: 76.w,
                    height: 76.w,
                    fit: BoxFit.cover,

                  ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 15.h,
                bottom: 15.h,
              ),
              child:
                  Text(
                    "Let's  chat",textAlign: TextAlign.center,
                    style: TextStyle(
                      color:AppColors.thirdElement,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      height: 1
                    ),
                  ),



            )
          ],
        ),
      );
    }

    Widget _buildThirdPartyLogin(){
      return Container(
        width: 295.w,
        margin: EdgeInsets.only(
          bottom: 280.h,
        ),
        child: Column(
          children: [
            Text("Sign in With social networks", style: TextStyle(
                color:AppColors.primaryText,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
            ),
            ),
            Padding(padding: EdgeInsets.only(
                top: 30.h,left:50.w,right: 50.w
            ),
              child: btnFlatButtonWidget(onPressed: ()=>controller.handleSignIn(),
                  width: 200.w,
                  height: 55.h,
                  title: "Google Login"
              ),

            ),
          ],
        ),
      );
    }
    return Scaffold(

      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            Spacer(),
            _buildThirdPartyLogin(),
          ],
        ),
      ),
    );
  }
}
