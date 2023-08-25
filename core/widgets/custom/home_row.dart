import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeRow extends StatelessWidget {
  const HomeRow({required this.title ,required this.icon,
    Key? key,
  }) : super(key: key);
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(children: [Icon(icon),
      SizedBox(width: 20.w,),
      Text(title)],);
  }
}