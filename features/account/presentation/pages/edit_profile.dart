import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/router/app_state.dart';
import '../../../../../core/router/models/page_config.dart';
import '../../../../../core/utils/globals/globals.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const EditProfileContent();
  }
}

class EditProfileContent extends StatefulWidget {
  const EditProfileContent({Key? key}) : super(key: key);
  @override
  State<EditProfileContent> createState() => _EditProfileContentState();
}

class _EditProfileContentState extends State<EditProfileContent> with SingleTickerProviderStateMixin {
  File? selectImage;
  String base64Image = "";
  late TabController tabController;
  Future<void> chooseImage(type) async {
    var image;
    if (type == "camera") {
      image = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
    } else {
      image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
    }
    if (image != null) {
      setState(() {
        selectImage = File(image.path);
        base64Image = base64Encode(selectImage!.readAsBytesSync());
      });
    }
  }

  @override
  void initState() {
    tabController=TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Uber Account",
            style: TextStyle(color: Colors.black),
          ),
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                height: 60.h,
                width: 300.w,
                child: TabBar(
                  isScrollable: true,
                  // controller: tabController,
                  indicatorColor: Colors.black,
                  indicatorWeight: 5.0,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                      child: SizedBox(
                        width: 120.w,
                        child:  Text(
                          'Account info',
                          style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Tab(
                      // text: 'Security',
                      child: SizedBox(
                        width: 70.w,
                        child:  Text(
                          'Security',
                          style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.w,top: 30.h),
                        child: Text(
                          'Account Info',
                          style: TextStyle(
                              fontSize: 36.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 18.w),
                        child: InkWell(
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                height: 105.h,
                                width: 105.h,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  gradient: const RadialGradient(colors: [
                                    Colors.white,
                                    Colors.white,
                                    Colors.black12
                                  ],
                                      center: Alignment.center),
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.r),
                                  child: selectImage != null
                                      ? Image.file(
                                    selectImage!,
                                    height: 95.h,
                                    width: 95.w,
                                    fit: BoxFit.cover,
                                  )
                                      : Icon(
                                    Icons.person,
                                    size: 50.sp,
                                    color: Colors.black26,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  height: 30.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.circular(40.r)),
                                  child: const Icon(Icons.edit),
                                ),
                              )
                            ],
                          ),
                          onTap: () {
                            chooseImage("Gallery");
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 18.w,bottom: 10,top:40),
                        child: Text(
                          'Basic Info',
                          style: TextStyle(
                              fontSize: 26.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      InkWell(
                        child:  ListTile(
                          title: Text('Name',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.normal),
                          ),
                          subtitle:  Text('Khan Khan'

                            ,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.normal),


                          ),
                        ),
                        onTap: () {
                          AppState appState = sl();
                          appState.goToNext(PageConfigs.firstNamePageConfig);
                        },
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      InkWell(
                        child: ListTile(
                          title: const Text('Phone number'),
                          subtitle: Row(
                            children: const [
                              Text('+92 (340) 954-4998'),
                              Icon(
                                Icons.check_circle_rounded,
                                color: Colors.green,
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          AppState appState = sl();
                          appState.goToNext(PageConfigs.phoneNumberPageConfig);
                        },
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),

                      InkWell(
                        child: const ListTile(
                          title: Text('Email'),
                          subtitle: Text('+92 (340) 954-4998'),
                        ),
                        onTap: () {
                          AppState appState = sl();
                          appState.goToNext(PageConfigs.emailContentPageConfig);
                        },
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.w,top: 20),
                        child: Text(
                          'Security',
                          style: TextStyle(
                              fontSize: 36.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: const Text(
                          'Logging in to Uber',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 15.w,
                        ),
                        child: InkWell(
                          child: const SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Password',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                          onTap: () {
                            AppState appState = sl();
                            appState.goToNext(PageConfigs.passwordContentPageConfig);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
