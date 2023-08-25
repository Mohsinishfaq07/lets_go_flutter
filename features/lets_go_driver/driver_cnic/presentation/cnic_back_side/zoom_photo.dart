import 'dart:io'as i;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ZoomPhotoCNICBackSideContent extends StatefulWidget {
  i.File selectImage;

  ZoomPhotoCNICBackSideContent({
    required this.selectImage,
  });

  @override
  State<ZoomPhotoCNICBackSideContent> createState() => _ZoomPhotoCNICBackSideContentState();
}

class _ZoomPhotoCNICBackSideContentState extends State<ZoomPhotoCNICBackSideContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Padding(
               padding: EdgeInsets.only(top: 50.h),
               child: GestureDetector(
                   child: Container(
                       child: Icon(Icons.arrow_back,size: 30.sp,)
                   ),
                 onTap: (){
                     Navigator.pop(context);
                 },
               ),
             ),
              SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: InteractiveViewer(
                        child: Image.file(
                          widget.selectImage,
                          fit: BoxFit.fitWidth,
                        )
                    ),
                  ),
            ],
          ),
        )
    );
  }
}
