import 'package:flutter/material.dart';

import '../../common/values/colors.dart';
import '../../common/widgets/app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Chat/Widgets/messageList.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  AppBar _buildAppBar(){
    return transparentAppBar(
      title:Text("Message",style: TextStyle(
        color: AppColors.primaryBackground,
        fontSize: 18.sp,
      fontWeight: FontWeight.w600,

      ),)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: MessageList(),
    );
  }
}
