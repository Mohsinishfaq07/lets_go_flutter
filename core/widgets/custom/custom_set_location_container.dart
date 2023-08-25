import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSetLocationContainer extends StatelessWidget {
  const CustomSetLocationContainer({
    required this.title,
    this.icon,
    this.isSelected = false,
    this.onTap,
    Key? key,
  }) : super(key: key);
  final String title;
  final IconData? icon;
  final bool isSelected;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding:  EdgeInsets.symmetric(vertical: 6.h),
        child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
        Container(
            height: 34,
            width: 34,
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(100)),
            child: Icon(icon)),
        SizedBox(
          width: 20.w,
        ),
        InkWell(
          onTap: onTap,
          child: Text(title,
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black87,
              )),
        ),
    ],
        ),
      ),


    ]);
  }
}
