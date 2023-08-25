import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomList extends StatelessWidget {
  final String title;
  final IconData trailing;
  final VoidCallback onTap;
  const CustomList({Key? key,
    required this.title,
    required this.trailing,
    required this.onTap,
  }) : super(key: key);
  @override  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(fontSize: 18.sp),),
          Icon(trailing,size: 16.sp,)
        ],
      ),
    );
  }
}