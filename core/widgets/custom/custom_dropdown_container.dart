import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownContainer extends StatelessWidget {
  const CustomDropDownContainer({
    this.icon1,
    this.icon2,
    required this.title,
    this.isSelected = false,
    Key? key,
  }) : super(key: key);
  final String title;
  final IconData? icon1;
  final IconData? icon2;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.black12,
          borderRadius: BorderRadius.circular(60.r)),
      height: 38.h,

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon1,
              color: isSelected ? Colors.white : Colors.black,
            ),
            AnimatedDefaultTextStyle(
                child: Text(title),
                style:
                    TextStyle(color: isSelected ? Colors.white : Colors.black),
                duration: Duration(milliseconds: 400)),
            Icon(
              icon2,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
