import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sb_myreports/features/lets_go_driver/driver_cnic/presentation/cnic_back_side/zoom_photo.dart';


class CNICBackSide extends StatelessWidget {
  const CNICBackSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CNICBackSideContent();
  }
}

class CNICBackSideContent extends StatefulWidget {
  const CNICBackSideContent({Key? key}) : super(key: key);
  @override
  State<CNICBackSideContent> createState() => _CNICBackSideContentState();
}

class _CNICBackSideContentState extends State<CNICBackSideContent> {
  File? selectImage;
  String base64Image = "";

  Future<void> chooseImage(type) async {
    var image;
    if (type == "camera"){
      image = await ImagePicker()
          .pickImage(source: ImageSource.camera,);
    } else {
      image = await ImagePicker()
          .pickImage(source: ImageSource.gallery,);
    }

    if (image != null) {
      setState(() {
        selectImage =File(image.path);
        base64Image = base64Encode(selectImage!.readAsBytesSync());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.only(bottom: 120.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
                    backgroundColor: Colors.black,
                    toolbarHeight: 70.h,
                    title: const Text('Uber',style: TextStyle(color: Colors.white),),
                    actions: [
                      Padding(
                        padding:  EdgeInsets.only(bottom: 12.h),
                        child: Container(
                          margin: EdgeInsets.only(top: 20.h),
                          width: 80.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.r)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('Help',style: TextStyle(color: Colors.black),),
                              Icon(Icons.arrow_drop_down_sharp,color: Colors.black,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 145.h,
                    decoration: const BoxDecoration(
                        color: Color(0xffe7edff),
                        boxShadow: [
                          BoxShadow(color: Colors.grey,spreadRadius: 2.0)
                        ]
                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(top: 8.h,),
                      child: ListTile(
                        leading: Padding(
                          padding:  EdgeInsets.only(top: 35.h,),
                          child: Icon(Icons.account_circle_outlined,size: 30.sp,color: Colors.lightBlue,),
                        ),
                        title: Text('Visit a Hero Center',style: TextStyle(fontSize: 17.sp),),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Visit one of the nearest Hero Centers in your city to complete your account verification and registration',style: TextStyle(color: Colors.black,fontSize: 13.sp),),
                              SizedBox(
                                height: 10.h,
                              ),
                              const Text('Location & Timings',style: TextStyle(color: Color(0xff2445c5),),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 15.w, right: 15.w,top: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Take a photo of your CNIC Back Side',style: TextStyle(fontSize: 22.sp,fontWeight: FontWeight.bold),),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text("Take a picture of the back side of your national ID card (include all corners).1. Make sure that picture is clear and all words are easily readable.2. All of the information like your present and permanent address, the expiration date etc. should be clearly visible.3. If any of the information is blurry or too shiny (from camera false), card will be rejected. 4. Missing information or tapering with information or the photo will also lead to rejection.",style: TextStyle(fontSize: 13.sp,color: Colors.black87),),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.info,color: Color(0xff2445c5),),
                            SizedBox(
                              width: 10.w,
                            ),
                            const Text('What is this?',style: TextStyle(color: Color(0xff2445c5)),)
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        GestureDetector(
                          child: Column(
                             crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 120,
                                width: 220,
                                child: selectImage != null
                                    ? Image.file(selectImage!,
                                  height: 300,
                                  width: 600,
                                  fit: BoxFit.fill,
                                )
                                    : Icon(Icons.add,size: 50.sp,color: Colors.black26,),

                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.zoom_in,color: Colors.black26,),
                                  Text('ZOOM',style: TextStyle(color: Colors.black26),)
                                ],
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) {
                              return ZoomPhotoCNICBackSideContent(selectImage:selectImage!,);
                            }));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 90.h,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 3,
                      blurRadius: 3
                  )]
              ),
              child: Center(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: InkWell(
                      child: Container(
                        height: 50,
                        width: 350,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: const Center(child: Text('Take photo',style: TextStyle(color: Colors.white),)),
                      ),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 90.h,
                              child: Center(
                                child: Row(

                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    TextButton(
                                        onPressed: (){
                                          chooseImage("camera");
                                        },
                                        child: Text('Camera',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold))
                                    ),
                                    TextButton(
                                        onPressed: (){
                                          chooseImage("Gallery");
                                        },
                                        child: Text('Gallery',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}






