import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomContainer extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  const CustomContainer({Key? key,
    required this.text,
    required this.icon,
    required this.onTap  }) : super(key: key);
  @override  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        width: 100.w,
        height: 90.h,
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10.r)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            SizedBox(
              height: 5.h,
            ),
            Text(text)
          ],
        ),
      ),
    );
  }
}