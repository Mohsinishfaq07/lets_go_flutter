import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/widgets/custom/custom_button_login_screen.dart';

import '../../../../../core/router/app_state.dart';
import '../../../../../core/router/models/page_config.dart';
import '../../../../../core/utils/globals/globals.dart';
import 'otp_screen.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ForgotPasswordContent();
  }
}

class ForgotPasswordContent extends StatefulWidget {
  const ForgotPasswordContent({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordContent> createState() => _ForgotPasswordContentState();
}

class _ForgotPasswordContentState extends State<ForgotPasswordContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 30.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Icon(Icons.arrow_back_outlined,size: 38.sp,),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
                 SizedBox(
                  height: 30.h,
                ),
                Center(
                  child: SizedBox(
                    height: 80.h,
                      width: 80.w,
                      child: Image.asset('assets/images/men.png',)
                  ),
                ),
                 SizedBox(
                  height: 30.h,
                ),
                const Center(child: Text('OTP Verification')),
                SizedBox(height: 40.h,),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 12.sp,color: Colors.black54),
                      children: const <TextSpan>[
                        TextSpan(text: 'We will send you on '),
                        TextSpan(text: 'One Time Password ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                    TextSpan(text: 'on\n                          this mobile number'),
                    ]
                     )
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  color: Colors.grey.shade200,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Your Mobile  Number',
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.r),
                      )
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomButtonLoginScreen(
                    title: 'Get OTP',
                    titleColor: Colors.white,
                    color: Colors.black,
                    radius: BorderRadius.circular(10.r),
                    onTap: (){
                      AppState appState = sl();
                      appState.goToNext(PageConfigs.otpScreenPageConfig);
                    }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
