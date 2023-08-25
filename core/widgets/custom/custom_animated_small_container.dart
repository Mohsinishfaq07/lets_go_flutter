import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAnimatedSmallContainer extends StatelessWidget {
  const CustomAnimatedSmallContainer({
    required this.title,
    this.isSelected = false,
    required this.color,
    Key? key,
  }) : super(key: key);
  final String title;
  final bool isSelected;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
          color: isSelected ? color: Colors.black12,
          borderRadius: BorderRadius.circular(60)),
      height: 40.h,
      width: 60.w,
      child: Center(
          child: AnimatedDefaultTextStyle(
              child: Text(title),
              style: TextStyle(
                  color: isSelected ? Colors.white : Colors.pink,
                  fontSize: 14.sp),
              duration: Duration(milliseconds: 400))),
    );
  }
}
