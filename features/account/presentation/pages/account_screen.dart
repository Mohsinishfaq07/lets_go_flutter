import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/router/app_state.dart';
import '../../../../core/router/models/page_config.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../../core/widgets/custom/custom_container.dart';
import '../../../../core/widgets/custom/custom_list_tile.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const AccountScreenContent();
  }
}

class AccountScreenContent extends StatefulWidget {
  const AccountScreenContent({Key? key}) : super(key: key);
  @override
  State<AccountScreenContent> createState() => _AccountScreenContentState();
}

class _AccountScreenContentState extends State<AccountScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 15.w,
                  right: 15.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Khan Khan',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 35),
                        ),
                        Container(
                            height: 25.h,
                            width: 50.w,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(50.r)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 13.sp,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                const Text(
                                  '5.0',
                                  style: TextStyle(fontSize: 13),
                                )
                              ],
                            ))
                      ],
                    ),
                    InkWell(
                      child: Container(
                        height: 65.h,
                        width: 65.h,
                        decoration: BoxDecoration(
                            gradient: const RadialGradient(colors: [
                              Colors.white,
                              Colors.white,
                              Colors.black54
                            ],
                                center: Alignment.center),
                            borderRadius: BorderRadius.circular(50.r),
                            color: Colors.black12),
                        child: Icon(
                          Icons.person,
                          size: 30.sp,
                        ),
                      ),
                      onTap: () {
                        AppState appState = sl();
                        appState
                            .goToNext(PageConfigs.editProfileScreenPageConfig);
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 15.w,
                  right: 15.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomContainer(
                      text: 'Help',
                      icon: (Icons.help),
                      onTap: () {
                        AppState appState = sl();
                        appState.goToNext(PageConfigs.helpPageConfig);
                      },
                    ),
                    CustomContainer(
                      text: 'Wallet',
                      icon: (Icons.wallet),
                      onTap: () {
                        AppState appState = sl();
                        appState.goToNext(PageConfigs.walletPageConfig);
                      },
                    ),
                    CustomContainer(
                      text: 'Trips',
                      icon: (Icons.access_time_filled_sharp),
                      onTap: () {
                        AppState appState = sl();
                        appState.goToNext(PageConfigs.helpATripPageConfig);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                child: Container(
                  margin: EdgeInsets.only(
                    left: 15.w,
                    right: 15.w,
                  ),
                  padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                      title: const Text('Safety checkup'),
                      subtitle: Text(
                        'Bost your safety profile by turning on additional features',
                        style: TextStyle(fontSize: 12.sp),
                      ),
                      trailing: Stack(
                        children: [
                          SizedBox(
                            width: 47.w,
                            height: 47.h,
                            child: const CircularProgressIndicator(
                              value: 0.3,
                              backgroundColor: Colors.white,
                              strokeWidth: 6,
                            ),
                          ),
                          Positioned(
                              left: 10.w,
                              top: 13.h,
                              child: const Text(
                                '1/3',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      )),
                ),
                onTap: () {
                  AppState appState = sl();
                  appState.goToNext(PageConfigs.safetyCheckupPageConfig);
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              Divider(
                color: Colors.grey.shade200,
                thickness: 7.sp,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomListTile(
                      title: 'Message',
                      leading: Icons.mail,
                      onTap: () {
                        AppState appState = sl();
                        appState.goToNext(PageConfigs.messagePageConfig);
                      },
                    ),
                    CustomListTile(
                      title: 'Send a gift',
                      leading: Icons.card_giftcard,
                      onTap: () {
                        // AppState appState = sl();
                        // appState.goToNext(PageConfigs.sendAGiftPageConfig);
                      },
                    ),
                    CustomListTile(
                      title: 'Settings',
                      leading: Icons.settings,
                      onTap: () {
                        // AppState appState = sl();
                        // appState.goToNext(PageConfigs.settingsPageConfig);
                      },
                    ),
                    CustomListTile(
                        title: 'Legal', leading: Icons.info, onTap: () {}
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=> LegalContent()));                          },
                        ),
                    CustomListTile(
                      title: 'About apps and web',
                      leading: Icons.book,
                      onTap: () {},
                    ),
                    CustomListTile(
                      title: 'Earn by driving or delivering',
                      leading: Icons.person,
                      onTap: () {
                        AppState appState = sl();
                        appState.goToNext(PageConfigs.driverSplashScreenPageConfig);
                      },
                    ),
                    CustomListTile(
                        title: ' Driving',
                        leading: Icons.car_crash,
                        onTap: () {}
                        // AppState appState = sl();                            //appState.goToNext(PageConfigs.earnByDrivingPageConfig);                          },
                        ),
                    const Text(
                      'v4.456.10001',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 20.h,),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
