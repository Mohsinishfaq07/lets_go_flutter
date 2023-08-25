import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/router/app_state.dart';
import '../../../../core/utils/globals/globals.dart';


class CustomoiseAppBar extends StatelessWidget {
  const CustomoiseAppBar({required this.title,
    Key? key,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 54.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              AppState appState= sl();
              appState.moveToBackScreen();
            },
            child: Icon(
              Icons.arrow_back,
              size: 30.h,
            ),
          ),
          SizedBox(width: 50.w,),
          Text(
            title,
            style:
            TextStyle(fontSize: 22.sp, ),
          ),
        ],
      ),
    );
  }
}
