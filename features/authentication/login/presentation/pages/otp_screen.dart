import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/router/app_state.dart';
import 'package:sb_myreports/core/utils/enums/page_state_enum.dart';
import 'package:sb_myreports/core/widgets/custom/custom_otp_fields.dart';

import '../../../../../core/router/models/page_config.dart';
import '../../../../../core/utils/globals/globals.dart';
import '../../../../../core/widgets/custom/custom_button_login_screen.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OTPScreenContent();
  }
}


class OTPScreenContent extends StatefulWidget {
  const OTPScreenContent({Key? key}) : super(key: key);

  @override
  State<OTPScreenContent> createState() => _OTPScreenContentState();
}

class _OTPScreenContentState extends State<OTPScreenContent> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.only(top: 30.h,left: 20.w,right: 20.w),
            child: SingleChildScrollView(
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
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomOtpFields(onChanged: (String ) {  },
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 12.sp,color: Colors.black54),
                          children: <TextSpan>[
                            const TextSpan(text: "Don't receive the OTP? "),
                            TextSpan(
                                text: 'Resend OTP',
                                style: TextStyle(decoration: TextDecoration.underline,fontSize: 12.sp,color: Colors.black),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {}
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 50.h,
                  ),
                  CustomButtonLoginScreen(
                      title: 'VERIFY & PROCEED',
                      titleColor: Colors.white,
                      color: Colors.black,
                      radius: BorderRadius.circular(10.r),
                      onTap: (){
                        AppState appState =sl();
                        appState.goToNext(PageConfigs.bottomNavigationBarScreenPageConfig,pageState: PageState.replaceAll);

                      }
                  ),
                  SizedBox(height: 20.h,),
                ],
              ),
            ),
          )
      ),
    );
  }
}
