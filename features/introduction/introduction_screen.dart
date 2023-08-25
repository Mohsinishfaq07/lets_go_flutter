import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/widgets/custom/continue_button.dart';

import '../../core/widgets/custom/customise_button.dart';
import '../../core/widgets/custom/custom_button_login_screen.dart';
import '../authentication/login/presentation/pages/signIn_screen.dart';


class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const IntroductionScreenContent();
  }
}


class IntroductionScreenContent extends StatefulWidget {
  const IntroductionScreenContent({Key? key}) : super(key: key);

  @override
  State<IntroductionScreenContent> createState() => _IntroductionScreenContentState();
}

class _IntroductionScreenContentState extends State<IntroductionScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color (0xFF2373FF),
      body: Padding(
        padding:  EdgeInsets.only(top: 50.h,right: 20.w,left: 20.w),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Text('Uber',style: TextStyle(color: Colors.white,fontSize: 38.sp),),
                SizedBox(
                  height: 70.h,
                ),
                SizedBox(
                  height: 150.h,
                 child: Image.asset('assets/images/men.png',),
                ),
                SizedBox(
                  height: 90.h,
                ),
                Text('Move with Safety',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 35.sp),),
                SizedBox(
                  height: 220.h,
                ),
                // CustomButton(
                //   title: 'Get Started',
                //   onTap: () {
                //     Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreenContent()));
                //   }, color: Colors.black,
                //   radius: BorderRadius.zero,
                //   icon: Icons.arrow_forward, titleColor: Colors.white,
                // ),

              ],
            ),
          ),
        ),
      )
    );
  }
}
