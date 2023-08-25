import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/router/app_state.dart';
import '../../../../core/router/models/page_config.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/globals/globals.dart';

class MyIncome extends StatelessWidget {
  const MyIncome({Key? key}) : super(key: key);
  @override  Widget build(BuildContext context) {
    return const MyIncomeContent();
  }
}
class MyIncomeContent extends StatefulWidget {
  const MyIncomeContent({Key? key}) : super(key: key);
  @override  State<MyIncomeContent> createState() => _MyIncomeContentState();
}
class _MyIncomeContentState extends State<MyIncomeContent> {
  @override  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          toolbarHeight: 70,
          elevation: 1,
          shadowColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Container(
            height: 55.h,
            width: 250.w,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.r),
                border: Border.all(color: Colors.lightGreen,width: 1)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 110.w,
                  height: 50.h,
                  padding: EdgeInsets.only(top: 10.h,bottom: 10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: Colors.lightGreen,
                  ),
                  child: Text('Ofline',style: TextStyle(color: Colors.black,fontSize: 18.sp),textAlign: TextAlign.center,),
                ),
                Container(
                  width: 110.w,
                  height: 50.h,
                  padding: EdgeInsets.only(top: 10.h,bottom: 10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: Colors.lightGreen,
                  ),
                  child: Text('Online',style: TextStyle(color: Colors.black,fontSize: 18.sp),textAlign: TextAlign.center,),
                ),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children: [
              ListTile(
                title: Text('Welcome',style: TextStyle(fontSize: 23.sp),),
                trailing: GestureDetector(
                  child: Image.asset(AppAssets.menPng,fit: BoxFit.fill,width: 35.w,),
                  onTap: (){
                    AppState appState = sl();
                    appState.goToNext(PageConfigs.partnerPhotoPageConfig);
                  },
                ),
              ),
              const ListTile(
                title: Text('Required steps',style: TextStyle(fontSize: 18),),
                subtitle: Text("Here's what you need to do set up your account",style: TextStyle(fontSize: 15)),
              ),
              GestureDetector(
                child:  ListTile(
                  leading: const Icon(Icons.book,color: Colors.black,),
                  title: const Text('Terms and Conditions'),
                  subtitle: const Text('Recommended next step',style: TextStyle(color: Color(0xff516cfc),),),
                  trailing: Icon(Icons.arrow_forward_ios_sharp,size: 15.sp,),
                ),
                onTap: (){
                  AppState appState = sl();
                  appState.goToNext(PageConfigs.termsAndConditionsPageConfig);
                },
              ),
              Padding(
                padding:  EdgeInsets.only(left: 72.w ),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
              ),
              GestureDetector(
                child:  ListTile(
                  leading: const Icon(Icons.book,color: Colors.black,),
                  title: const Text('CNIC Back Side'),
                  subtitle: const Text('Get started',style: TextStyle(color: Colors.black),),
                  trailing: Icon(Icons.arrow_forward_ios_sharp,size: 15.sp,),
                ),
                onTap: (){
                  AppState appState = sl();
                  appState.goToNext(PageConfigs.cNICBackSidePageConfig);
                },
              ),
              Padding(
                padding:  EdgeInsets.only(left: 72.w),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
              ),
              GestureDetector(
                child:  ListTile(
                  leading: const Icon(Icons.book,color: Colors.black,),
                  title: const Text('CNIC Front Side'),
                  subtitle: const Text('Get started',style: TextStyle(color: Colors.black),),
                  trailing: Icon(Icons.arrow_forward_ios_sharp,size: 15.sp,),
                ),
                onTap: (){
                  AppState appState = sl();
                  appState.goToNext(PageConfigs.cNICFrontSidePageConfig);
                },
              ),
              Padding(
                padding: EdgeInsets.only(left: 72.w),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 72.w),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
              ),
              GestureDetector(
                child:  ListTile(
                  leading: const Icon(Icons.book,color: Colors.black,),
                  title: const Text('Driving License Front Side'),
                  subtitle: const Text('Get started',style: TextStyle(color: Colors.black),),
                  trailing: Icon(Icons.arrow_forward_ios_sharp,size: 15.sp,),
                ),
                onTap: (){
                  AppState appState = sl();
                  appState.goToNext(PageConfigs.drivingLicenseFrontSidePageConfig);
                },
              ),
              Padding(
                padding:  EdgeInsets.only(left: 72.w),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
              ),
              GestureDetector(
                child: ListTile(
                  leading: const Icon(Icons.book,color: Colors.black,),
                  title: const Text('Vehicle Registration Book'),
                  subtitle: const Text('Get started',style: TextStyle(color: Colors.black),),
                  trailing: Icon(Icons.arrow_forward_ios_sharp,size: 15.sp,),
                ),
                onTap: (){
                  AppState appState = sl();
                  appState.goToNext(PageConfigs.vehicleRegistrationBookPageConfig);
                },
              ),
              Padding(
                padding:  EdgeInsets.only(left: 72.w),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
              ),
            ],
          ),
        ),
        body:const Center(
          child: Text('All your previous requests will be shown here with in'),
        )
    );
  }
}