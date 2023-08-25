import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom/custom_animated_small_container.dart';
import '../../../../../core/widgets/custom/customise_button.dart';

class ActivityBottomSheet extends StatefulWidget {
  const ActivityBottomSheet({Key? key}) : super(key: key);

  @override
  State<ActivityBottomSheet> createState() => _ActivityBottomSheetState();
}

class _ActivityBottomSheetState extends State<ActivityBottomSheet> {
  int selectedService= 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
      const BoxDecoration(color: Colors.transparent),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),

        ),),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
              EdgeInsets.symmetric(vertical: 20.h),
              child: Text(
                "Filter by... ",
                style: TextStyle(fontSize: 18.sp),
              ),
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20.h, bottom: 10.h),
                    child: Text(
                      "services",
                      style: TextStyle(
                        fontSize: 20.sp,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedService =0;
                          });
                        },
                        child:
                        CustomAnimatedSmallContainer(
                          isSelected: selectedService == 0,
                          title: "All",
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(
                        width: 8.w,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedService= 1;
                          });
                        },
                        child:
                        CustomAnimatedSmallContainer(
                          isSelected: selectedService==1,
                          title: "Trips",
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 8.w,),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedService = 2;
                          });
                        },
                        child: CustomAnimatedSmallContainer(
                          isSelected: selectedService==2,
                          title: "Eat", color: Colors.black,),
                      ),
                    ],
                  ),
                  AnimatedSwitcher(
                    duration:
                    const Duration(milliseconds: 400),
                    layoutBuilder: (currentChild,
                        previousChildren) =>
                    selectedService==0
                        ? SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                          children: []),
                    )
                        : Column(
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                      children: [],
                    ),

//
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 20,horizontal: 10),
              child: CustomButton(
                title: 'Apply',
                textcolor: Colors.white,
                bgColor: Colors.black,
                ontap: () {Navigator.pop(context);},
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}

