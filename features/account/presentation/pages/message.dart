import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MessageContent();
  }
}

class MessageContent extends StatefulWidget {
  const MessageContent({Key? key}) : super(key: key);
  @override
  State<MessageContent> createState() => _MessageContentState();
}

class _MessageContentState extends State<MessageContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 130.h,
            width: 500.w,
            color: Colors.black,
            child: Padding(
              padding: EdgeInsets.only(
                top: 40.h,
                left: 15.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: Container(
                      child: const Icon(
                        Icons.cancel,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Messages',
                    style: TextStyle(color: Colors.white, fontSize: 35.sp),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 63.h,
                      width: 55.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: Colors.green),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        child: Icon(
                          Icons.check,
                          size: 60.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 53.h,
                      child: Container(
                        height: 10.h,
                        width: 55.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5.r),
                                bottomRight: Radius.circular(5.r)),
                            color: Colors.black),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                const Text(
                  'You are all up to date!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Text(
                    '  No new message available at the\nmoment, come back soon to discover\n                       new offers!')
              ],
            ),
          )
        ],
      ),
    );
  }
}
