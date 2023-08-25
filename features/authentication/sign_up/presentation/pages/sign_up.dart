import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/router/app_state.dart';
import '../../../../../core/router/models/page_config.dart';
import '../../../../../core/utils/constants/app_assets.dart';
import '../../../../../core/utils/globals/globals.dart';
import '../../../../../core/utils/validators/form_validator.dart';
import '../../../../../core/widgets/custom/continue_button.dart';
import '../../../../../core/widgets/custom/custom_form_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  // SignUpProvider signUpProvider =sl();
  @override
  Widget build(BuildContext context) {
    return
        // ChangeNotifierProvider.value(value: signUpProvider,child:
        const SignUpScreenContent();
  }
}

class SignUpScreenContent extends StatefulWidget {
  const SignUpScreenContent({Key? key}) : super(key: key);

  @override
  State<SignUpScreenContent> createState() => _SignUpScreenContentState();
}

class _SignUpScreenContentState extends State<SignUpScreenContent> {
  final _formKey = GlobalKey<FormState>();
  // SignUpProvider signUpProvider =sl();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.w, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row(
                      //   children: [
                      //     GestureDetector(
                      //       child: Icon(
                      //         Icons.arrow_back_outlined,
                      //         size: 38.sp,
                      //       ),
                      //       onTap: () {
                      //         Navigator.pop(context);
                      //       },
                      //     ),
                      //     SizedBox(
                      //       width: 60.w,
                      //     ),
                      //     Image.asset(
                      //       AppAssets.car1,
                      //       height: 80.h,
                      //     ),
                      //   ],
                      // ),

                      Text('Want to finish your hunger ?',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 22.sp)),

                      // SvgPicture.asset(AppAssets.googlePng, height: 45.h),
                      Text('Lets Go For Eats ',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 24.sp)),
                    ],
                  ),
                ),
                Container(
                  height: 610.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0.r),
                      topRight: Radius.circular(30.0.r),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 10.h),
                          CustomTextFormField(
                            validator: FormValidators.validateName,
                            //     (val){
                            //   if(val!=null){
                            //     if(val.isEmpty){
                            //       return "Field cannot be empty";
                            //     }
                            //     else if(val.length!=8){
                            //       return "shit you exceeded your limit";
                            //     }
                            //     else if(!RegExp(r'(^(?:[+0][1-9])?[0-9]{8,13}$)').hasMatch(val)){
                            //       return "Invalid phone number";
                            //     }
                            //   }
                            // },
                            maxLines: 1,
                            hintText: "Enter full name ",
                            // context.read<SignUpProvider>().fullnameCont.toString(),
                            labelText: "Enter full name ",
                            // context.read<SignUpViewModel>().fullNameLabelText,
                            controller: fullNameController,
                            // .fullNameController,
                            // focusNode:
                            // context.read<SignUpViewModel>().fullNameFocusNode,
                            keyboardType: TextInputType.name,
                            // validator: TextFieldValidator.validateName,
                            // onFieldSubmitted: (value) {
                            //   FocusScope.of(context).requestFocus(context
                            //       .read<SignUpViewModel>()
                            //       .phoneNumberFocusNode);
                            // },
                          ),
                          SizedBox(height: 14.h),
                          CustomTextFormField(
                            maxLines: 1,
                            hintText: "Enter your Country",
                            // context.read<SignUpViewModel>().fullNameHintText,
                            labelText: "Enter your Country",
                            // context.read<SignUpViewModel>().fullNameLabelText,
                            controller: countryController,

                            //context
                            // .read<SignUpViewModel>()
                            // .fullNameController,
                            // focusNode:
                            // context.read<SignUpViewModel>().fullNameFocusNode,
                            // validator: FormValidators.,
                            // onFieldSubmitted: (value) {
                            //   FocusScope.of(context).requestFocus(context
                            //       .read<SignUpViewModel>()
                            //       .phoneNumberFocusNode);
                            // },
                          ),
                          SizedBox(height: 14.h),
                          CustomTextFormField(
                            controller: cityController,
                            validator: FormValidators.validateCity,
                            maxLines: 1,
                            hintText: "Enter you City ",
                            // context.read<SignUpViewModel>().fullNameHintText,
                            labelText: "Enter your City  ",
                            // context.read<SignUpViewModel>().fullNameLabelText,
                            // controller:
                            //context
                            // .read<SignUpViewModel>()
                            // .fullNameController,
                            // focusNode:
                            // context.read<SignUpViewModel>().fullNameFocusNode,
                            keyboardType: TextInputType.name,
                            // validator: TextFieldValidator.validateName,
                            // onFieldSubmitted: (value) {
                            //   FocusScope.of(context).requestFocus(context
                            //       .read<SignUpViewModel>()
                            //       .phoneNumberFocusNode);
                            // },
                          ),
                          SizedBox(height: 10.h),
                          CustomTextFormField(
                            maxLines: 1,
                            hintText: "Enter your phone number ",
                            // context
                            //     .read<SignUpViewModel>()
                            //     .phoneNumberHintText,
                            labelText: "Enter your phone number ",
                            controller: phoneController,
                            // context
                            //     .read<SignUpViewModel>()
                            //     .phoneNumberLabelText,
                            // controller: context
                            //     .read<SignUpViewModel>()
                            //     .phoneNumberController,
                            // focusNode: context
                            //     .read<SignUpViewModel>()
                            //     .phoneNumberFocusNode,
                            // inputFormatters: [
                            //   LengthLimitingTextInputFormatter(11),
                            //   FilteringTextInputFormatter.digitsOnly
                            // ],
                            keyboardType: TextInputType.phone,
                            // validator: TextFieldValidator.validatePhone,
                            // onFieldSubmitted: (value) {
                            //   FocusScope.of(context).requestFocus(
                            //       context.read<SignUpViewModel>().emailFocusNode);
                            // },
                          ),
                          SizedBox(height: 10.h),
                          CustomTextFormField(
                            maxLines: 1,
                            hintText: "Enter your Email",
                            controller: emailController,
                            validator: FormValidators.validateEmail,
                            // context.read<SignUpViewModel>().emailHintText,
                            labelText: "Enter your Email",
                            // context.read<SignUpViewModel>().emailLabelText,
                            // controller:
                            // context.read<SignUpViewModel>().emailController,
                            // focusNode:
                            // context.read<SignUpViewModel>().emailFocusNode,
                            keyboardType: TextInputType.emailAddress,
                            // validator: TextFieldValidator.validateEmail,
                            // onFieldSubmitted: (value) {
                            //   FocusScope.of(context).requestFocus(context
                            //       .read<SignUpViewModel>()
                            //       .passwordFocusNode);
                            // },
                          ),
                          SizedBox(height: 10.h),
                          CustomTextFormField(
                            maxLines: 1,
                            obscureText: true,
                            hintText: "Enter your Password",
                            controller: passwordController,
                            // context.read<SignUpViewModel>().passwordHintText,
                            labelText: "Enter your Password",

                            // context.read<SignUpViewModel>().passwordLabelText,
                            // controller: context
                            //     .read<SignUpViewModel>()
                            //     .passwordController,
                            // focusNode:
                            // context.read<SignUpViewModel>().passwordFocusNode,
                            keyboardType: TextInputType.visiblePassword,
                            // validator: TextFieldValidator.validatePassword,
                            // onFieldSubmitted: (value) {
                            //   FocusScope.of(context).requestFocus(context
                            //       .read<SignUpViewModel>()
                            //       .confirmPasswordFocusNode);
                            // },
                          ),
                          SizedBox(height: 12.h),
                          CustomTextFormField(
                            maxLines: 1,
                            obscureText: true,
                            hintText: "Confirm Password",
                            // context
                            //     .read<SignUpViewModel>()
                            //     .confirmPasswordHintText,
                            labelText: "Confirm Password",
                            // validator: FormValidators.validateConfirmPassword(value, existing),
                            // context
                            //     .read<SignUpViewModel>()
                            //     .confirmPasswordLabelText,
                            // controller: context
                            //     .read<SignUpViewModel>()
                            //     .confirmPasswordController,
                            // focusNode: context
                            //     .read<SignUpViewModel>()
                            //     .confirmPasswordFocusNode,
                            keyboardType: TextInputType.visiblePassword,
                            // validator: (value) {
                            //   return TextFieldValidator.validateConfirmPassword(
                            //       value,
                            //       context
                            //           .read<SignUpViewModel>()
                            //           .passwordController
                            //           .text);
                            // },
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                          ),
                          SizedBox(height: 24.h),
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 150.w,
                              height: 36.h,
                              child: ContinueButton(
                                // loadingNotifier: context
                                //     .read<SignUpViewModel>()
                                //     .isLoadingNotifier,
                                text: 'SignUp',
                                onPressed: () async {
                                  if (!_formKey.currentState!.validate()) {
                                  } else {
                                    AppState appState = sl();
                                    appState.goToNext(PageConfigs
                                        .bottomNavigationBarScreenPageConfig);
                                    // signUpProvider.signUpUser();
                                  }

                                  // if (!_formKey.currentState!.validate()) {
                                  //   return;
                                  // }
                                  // await context
                                  //     .read<SignUpViewModel>()
                                  //     .registerUser();
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                if (!_formKey.currentState!.validate()) {}

                                AppState appState = sl();
                                appState.goToNext(
                                    PageConfigs.signInScreenPageConfig);
                              },
                              // context.read<SignUpViewModel>().moveToSignIn,
                              child: RichText(
                                text: TextSpan(
                                  text: 'Already have an account ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      ?.copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(
                                        text: 'Signin?',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
