import 'package:country_picker/country_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/router/app_state.dart';
import '../../../../../core/router/models/page_config.dart';
import '../../../../../core/utils/constants/app_assets.dart';
import '../../../../../core/utils/globals/globals.dart';
import '../../../../../core/widgets/custom/custom_button_login_screen.dart';
import '../../../../../core/widgets/custom/custom_buttons.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SignInScreenContent();
  }
}


class SignInScreenContent extends StatefulWidget {
  const SignInScreenContent({Key? key}) : super(key: key);

  @override
  State<SignInScreenContent> createState() => _SignInScreenContentState();
}

class _SignInScreenContentState extends State<SignInScreenContent> {
  bool selected = false;

  String countryFlag = '' ;
  String phoneCode = '' ;
  Country? selectedCountry;
  TextEditingController numberCont=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
        EdgeInsets.only(top: 30.h, left: 15.w, right: 15.w, bottom: 15.0),
        child: SingleChildScrollView(
          child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter your mobile number',
                    style: TextStyle(fontSize: 19.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Container(
                          width: 105.w,
                          height: 55.h,
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color:
                                  selected ? Colors.black : Colors.transparent,
                                  width: 2)),
                          child: Padding(
                            padding: EdgeInsets.only(left: 15.w, right: 15.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  countryFlag.toString(),
                                  style: TextStyle(fontSize: 30.sp),
                                ),
                                const Icon(Icons.arrow_drop_down_sharp)
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selected = !selected;
                          });
                          showCountryPicker(
                            context: context,
                            onSelect: (Country value) {
                              print(value.countryCode.toString());
                              print(value.phoneCode.toString());
                              print(value.flagEmoji.toString());
                              countryFlag = value.flagEmoji.toString();
                              selectedCountry = value;
                              setState(() {});
                            },
                          );
                        },
                      ),
                      // CustomTextFormField(hintText: "Mobile Number", labelText: "",controller: numberCont,)
                      Container(
                          width: 215.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r)),
                          child: TextField(
                            controller: numberCont,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    borderSide: BorderSide(
                                        width: 2.w, color: Colors.black)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2.w, color: Colors.black)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        width: 0,
                                        color: Colors.red.withOpacity(.8))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    borderSide: BorderSide(
                                        width: 0,
                                        color: Colors.white.withOpacity(.0))),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.white.withOpacity(.0))),
                                prefix: Text(
                                  "+" + (selectedCountry?.phoneCode ?? "") + " ",
                                  style: const TextStyle(color: Colors.black),
                                ),
                                hintText: 'Mobile number',
                                hintStyle: const TextStyle(color: Colors.grey)),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomButtons(
                    title: 'Continue',
                    onTap: () {
                      AppState appState = sl();
                      appState.goToNext(PageConfigs.otpScreenPageConfig);
                    },
                    color: Colors.black,
                    radius: BorderRadius.circular(10.r),
                    titleColor: Colors.white,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 140.w,
                        child: const Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ),
                      const Text(
                        'or',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 140.w,
                        child: const Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomButtonLoginScreen(
                    image: AppAssets.googlePng,
                    imageSize: 40.sp,
                    title: 'Continue with Google',
                    onTap: () {},
                    color: Colors.black12,
                    radius: BorderRadius.circular(10.r),
                    titleColor: Colors.black,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomButtonLoginScreen(
                    image: AppAssets.applePng,
                    imageSize: 40,
                    title: 'Continue with Apple',
                    onTap: () {},
                    color: Colors.black12,
                    radius: BorderRadius.circular(10.r),
                    titleColor: Colors.black,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomButtonLoginScreen(
                    image: AppAssets.facebookPng,
                    imageSize: 25,
                    title: 'Continue with Facebook',
                    onTap: () {},
                    color: Colors.black12,
                    radius: BorderRadius.circular(10.r),
                    titleColor: Colors.black,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                      child: TextButton(
                        onPressed: () {
                          AppState appState = sl();
                          appState.goToNext(PageConfigs.forgotPasswordPageConfig);
                        },
                        child: Text(
                          'Find my account',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.sp,
                              decoration: TextDecoration.underline),
                        ),
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                      child: TextButton(
                        onPressed: () {
                          AppState appState = sl();
                          appState.goToNext(PageConfigs.signUpScreenPageConfig);
                        },
                        child: Text(
                          'Create Your New Account',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.sp,
                              decoration: TextDecoration.underline),
                        ),
                      )),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    'By proceeding, you consent to get calls, WhatsApp or\nSMS messages, including by automated means, from\nUber and its affiliates to the number provided.',
                    style: TextStyle(fontSize: 12.sp, color: Colors.black54),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  CustomButtonLoginScreen(
                    image: AppAssets.googlePng,
                    imageSize: 40.sp,
                    title: 'Continue without Login',
                    onTap: () {

                      AppState appState =sl();
                      appState.goToNext(PageConfigs.bottomNavigationBarScreenPageConfig);
                    },
                    color: Colors.black12,
                    radius: BorderRadius.circular(10.r),
                    titleColor: Colors.black,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 12.sp, color: Colors.black54),
                      children: <TextSpan>[
                        const TextSpan(
                            text:
                            'This site is protected reCAPTCHA and the Google '),
                        TextSpan(
                            text: 'Privacy.\n',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 12.sp,
                                color: Colors.black),
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                        TextSpan(
                            text: 'Policy. ',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 12.sp,
                                color: Colors.black),
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                        const TextSpan(text: 'and '),
                        TextSpan(
                            text: 'Terms of Service ',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 12.sp,
                                color: Colors.black),
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                        const TextSpan(text: 'apply.'),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
