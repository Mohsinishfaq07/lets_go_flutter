import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/constants/app_assets.dart';
class PinVerification extends StatelessWidget {
  const PinVerification({Key? key}) : super(key: key);
  @override  Widget build(BuildContext context) {
    return const PinVerificationContent();
  }
}
class PinVerificationContent extends StatefulWidget {
  const PinVerificationContent({Key? key}) : super(key: key);
  @override  State<PinVerificationContent> createState() => _PinVerificationContentState();
}
class _PinVerificationContentState extends State<PinVerificationContent> {
  bool _value = false;
  @override  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 60,
        leading:  GestureDetector(
          child: Container(
            child: const Icon(Icons.arrow_back,color: Colors.white,),
          ),
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
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("What's a RideCheck?",style: TextStyle(fontSize: 18),),
                      SizedBox(
                        height: 30.h,
                      ),
                      const Text("Help make sure you get in the right car by verifying your ride with a PIN. You will receive a unique ",style: TextStyle(fontSize: 14),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Use PIN to verify rides'),
                        Switch(
                          value: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                            });
                          },
                          activeColor: Colors.black,
                          inactiveTrackColor: Colors.black54,
                          inactiveThumbColor: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}