import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/widgets/custom/custom_animated_small_container.dart';
import '../../../../core/widgets/custom/customise_button.dart';
import '../widgets/bottom_sheets/activity_bottom_sheet.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ActivityScreenContent();
  }
}

class ActivityScreenContent extends StatefulWidget {
  const ActivityScreenContent({Key? key}) : super(key: key);

  @override
  State<ActivityScreenContent> createState() => _ActivityScreenContentState();
}

class _ActivityScreenContentState extends State<ActivityScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Activity",
                style: TextStyle(fontSize: 42.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Past",
                    style: TextStyle(fontSize: 22.sp),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: InkWell(
                      onTap: () async {
                        await showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          builder: (context) => const ActivityBottomSheet(),
                        );
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 24.sp,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(600),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "you don't have any past activity",
                style: TextStyle(fontSize: 18.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
