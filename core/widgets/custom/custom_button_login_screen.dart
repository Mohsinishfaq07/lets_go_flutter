import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonLoginScreen extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final Color? color;
  final IconData? icon;
  final double? imageSize;
  final String? image;
  final BorderRadiusGeometry? radius;
  final VoidCallback onTap;
  const CustomButtonLoginScreen({Key? key,
    required this.title,
    this.imageSize,
    this.titleColor,
    this.color,
    this.icon,
    this.image,
    this.radius,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 400.w,
        decoration: BoxDecoration(
          color: color!,
          borderRadius: radius,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                if(image!=null)
                Image.asset(image!,width: imageSize,),
                 SizedBox(
                  width: 3.w,
                ),
                Text(title,style: TextStyle(color: titleColor,fontSize: 15.sp),),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
