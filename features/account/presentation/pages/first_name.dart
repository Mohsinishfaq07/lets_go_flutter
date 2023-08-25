import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/widgets/custom/custom_buttons.dart';
class FirstName extends StatelessWidget {
  const FirstName({Key? key}) : super(key: key);
  @override  Widget build(BuildContext context) {
    return const FirstNameContent();
  }
}
class FirstNameContent extends StatefulWidget {
  const FirstNameContent({Key? key}) : super(key: key);
  @override  State<FirstNameContent> createState() => _FirstNameContentState();
}
class _FirstNameContentState extends State<FirstNameContent> {
  @override  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.all(20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        child: Container(
                          child: Icon(Icons.arrow_back_outlined,size: 30.sp,),
                        ),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      const Text('Uber Account')
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 60.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('First Name',),
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
                                    width: 2.w, color: Colors.black                                  )
                            ),
                            hintText: 'First Name',
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Text('Last Name',),
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
                            hintText: 'Last Name',
                          ),
                        ),
                        SizedBox(
                            height: 100.h                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CustomButtons(
                            title: 'Update',
                            titleColor: Colors.white,
                            color: Colors.black,
                            radius: BorderRadius.circular(10.r),
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