import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/utils/constants/app_assets.dart';
import '../../../../../core/router/app_state.dart';
import '../../../../../core/router/models/page_config.dart';
import '../../../../../core/utils/globals/globals.dart';
class SafetyCheckup extends StatelessWidget {
  const SafetyCheckup({Key? key}) : super(key: key);
  @override  Widget build(BuildContext context) {
    return const SafetyCheckupContent();
  }
}
class SafetyCheckupContent extends StatefulWidget {
  const SafetyCheckupContent({Key? key}) : super(key: key);
  @override  State<SafetyCheckupContent> createState() => _SafetyCheckupContentState();
}
class _SafetyCheckupContentState extends State<SafetyCheckupContent> {
  @override  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 60,
        leading:  GestureDetector(
          child: const Icon(Icons.cancel,color: Colors.black,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 140.h,
                  width: 500.w,
                  child: Image.asset(AppAssets.facebookPng,fit: BoxFit.fill,),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 15.w, right: 15.w),
                      child: Text('Safety checkup',style: TextStyle(fontSize: 35.sp,fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 15.w, right: 15.w),
                      child: Text('To help keep yourself safe on every ride,\nreview your current safety settings',style: TextStyle(fontSize: 15.sp),),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    GestureDetector(
                      child: const ListTile(
                        leading: Icon(Icons.circle_outlined),
                        title: Text('Trusted Contact'),
                        subtitle: Text('Choose friends or family so you can quickly share your location, trip status, and other details'),
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                      ),
                      onTap: (){
                        AppState appState = sl();
                        appState.goToNext(PageConfigs.addTrustedContactConfig);
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    GestureDetector(
                      child: const ListTile(
                        leading: Icon(Icons.check_circle_rounded,color: Colors.green),
                        title: Text('RideCheck'),
                        subtitle: Text('Recieving automatic ckeck-ins and help notifications if you ride goes off course or is disrupted'),
                        trailing: Icon(Icons.arrow_forward_ios_sharp,),
                      ),
                      onTap: (){
                        AppState appState = sl();
                        appState.goToNext(PageConfigs.rideCheckPageConfig);
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    GestureDetector(
                      child: const ListTile(
                        leading: Icon(Icons.circle_outlined),
                        title: Text('PIN verification'),
                        subtitle: Text('Secure your ride by requiring a simple code to help ensure you get into the right car every time'),
                        trailing: Icon(Icons.arrow_forward_ios_sharp,),
                      ),
                      onTap: (){
                        AppState appState = sl();
                        appState.goToNext(PageConfigs.pinVerificationPageConfig);
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}