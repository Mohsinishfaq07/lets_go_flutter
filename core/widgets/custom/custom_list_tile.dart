
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final IconData? leading;
  final IconData? trailing;
  final VoidCallback onTap;
  const CustomListTile({Key? key,
    required this.title,
    required this.onTap,
    this.leading,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        title: Text(title,style: TextStyle(fontSize: 15.sp,),),
        leading: Icon(leading,size: 18.sp,color: Colors.black,),
        trailing: Icon(trailing,size: 18.sp,color: Colors.black,),
      ),
    );

  }
}
