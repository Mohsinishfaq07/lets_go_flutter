import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/constants/app_assets.dart';
class RideCheck extends StatelessWidget {
  const RideCheck({Key? key}) : super(key: key);
  @override  Widget build(BuildContext context) {
    return const RideCheckContent();
  }
}
class RideCheckContent extends StatefulWidget {
  const RideCheckContent({Key? key}) : super(key: key);
  @override  State<RideCheckContent> createState() => _RideCheckContentState();
}
class _RideCheckContentState extends State<RideCheckContent> {
  bool _value = false;
  @override  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 60,
        title: const Text('RideCheck'),
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
                Container(
                  color: Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("What's a RideCheck?",style: TextStyle(fontSize: 18),),
                        SizedBox(
                          height: 30.h,
                        ),
                        const Text("In this case of an unexpected event, Uber will initiate a Ride Check, providing you with access to relevant safety tools so that you can quickly get the help you need.",style: TextStyle(fontSize: 14),),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('RideCheckNotification'),
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
                Container(
                    height: 500.h,
                    color: Colors.grey.shade200,
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text("When turned on, Uber will send you a RideCheck notification if a trip doesn't progress as planned",style: TextStyle(fontSize: 14),),
                    )
                ),
              ],
            ),
          )
      ),
    );
  }
}