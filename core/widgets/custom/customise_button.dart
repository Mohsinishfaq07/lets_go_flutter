import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.title,
    required this.textcolor,
    required this.bgColor,
    required this.ontap,
    this.icon,
    this.isSelected = false,
    Key? key,
  }) : super(key: key);
  final String title;
  final Color textcolor;
  final Color bgColor;
  final Function()? ontap;
  final bool isSelected;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Container(
          height: 54.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: bgColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: 40.w,),
              TextButton(
                onPressed: ontap,
                child: Text(
                  title,
                  style: TextStyle(color: textcolor, fontSize: 16.sp),
                ),
              ),
              Icon(icon,color: Colors.white,),
            ],
          )),
    );
  }
}
