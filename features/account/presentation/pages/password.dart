import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom/custom_buttons.dart';
class Password extends StatelessWidget {
  const Password({Key? key}) : super(key: key);
  @override  Widget build(BuildContext context) {
    return const PasswordContent();
  }
}
class PasswordContent extends StatefulWidget {
  const PasswordContent({Key? key}) : super(key: key);
  @override  State<PasswordContent> createState() => _PasswordContentState();
}
class _PasswordContentState extends State<PasswordContent> {
  @override  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.all(20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: Icon(Icons.arrow_back_outlined,size: 30.sp,),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 60.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Confirm your email address',style: TextStyle(color: Colors.grey),),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: BorderSide(
                                    width: 2.w, color: Colors.black                                )
                            ),
                            hintText: 'Enter a new password',
                            suffixIcon: const Icon(Icons.remove_red_eye),
                          ),
                        ),
                        SizedBox(
                            height: 40.h                        ),
                        const Text('Secure passwords are at least 8 characters long and include numbers and symbols.',style: TextStyle(color: Colors.grey),),
                        SizedBox(
                            height: 40.h                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CustomButtons(
                            title: 'Update Password',
                            titleColor: Colors.white,
                            color: Colors.black,
                            onTap: (){},
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}