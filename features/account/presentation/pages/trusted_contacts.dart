import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/widgets/custom/custom_buttons.dart';
import '../../../../../../core/router/app_state.dart';
import '../../../../../../core/router/models/page_config.dart';
import '../../../../../../core/utils/globals/globals.dart';

class TrustedContact extends StatelessWidget {
  const TrustedContact({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const TrustedContactContent();
  }
}

class TrustedContactContent extends StatefulWidget {
  const TrustedContactContent({Key? key}) : super(key: key);
  @override
  State<TrustedContactContent> createState() => _TrustedContactContentState();
}

class _TrustedContactContentState extends State<TrustedContactContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.h, left: 20.w),
            child: GestureDetector(
              child: Container(
                child: const Icon(Icons.arrow_back_outlined),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 160.h, left: 20.w),
            child: Text(
              'Trusted\nContact',
              style: TextStyle(fontSize: 45.sp, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 70.h,
          ),
          const ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Share your trip status'),
            subtitle: Text(
                'You be able to share your live location with one or more contacts during any Uber trip'),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 73.w),
            child: Divider(
              thickness: 1,
              color: Colors.grey.shade200,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Set your emergency contacts'),
            subtitle: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 12.sp, color: Colors.black54),
                children: <TextSpan>[
                  const TextSpan(
                    text:
                        ("You can make a trusted contact an emergency contact, too. Uber can call them if we can't reach you min case of an emergency. "),
                  ),
                  TextSpan(
                      text: 'Learn more',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 12.sp,
                          color: Colors.black),
                      recognizer: TapGestureRecognizer()..onTap = () {}),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w),
            child: CustomButtons(
                title: 'Add trusted contact',
                titleColor: Colors.white,
                color: Colors.black,
                onTap: () {
                  AppState appState = sl();
                  appState.goToNext(PageConfigs.addTrustedContactConfig);
                }),
          )
        ],
      )),
    );
  }
}
