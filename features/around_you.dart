import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sb_myreports/core/widgets/custom/customise_button.dart';
import 'package:sb_myreports/core/widgets/custom/custom_lets_go_container.dart';
import '../../../../core/router/app_state.dart';
import '../../../../core/router/models/page_config.dart';
import '../../../../core/utils/globals/globals.dart';

class AroundYou extends StatelessWidget {
  const AroundYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AroundYouContent();
  }
}

class AroundYouContent extends StatefulWidget {
  const AroundYouContent({Key? key}) : super(key: key);

  @override
  State<AroundYouContent> createState() => _AroundYouContentState();
}

class _AroundYouContentState extends State<AroundYouContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height - 220,
                      width: MediaQuery.of(context).size.width,
                      child: const GoogleMap(
                          zoomControlsEnabled: true,
                          zoomGesturesEnabled: true,
                          mapType: MapType.normal,
                          myLocationButtonEnabled: true,
                          initialCameraPosition: CameraPosition(
                            target:
                            LatLng(37.42796133580664, -122.085749655962),
                            zoom: 10.5,
                          ))),
                  Positioned(
                      top: 10,
                      left: 10,
                      child: InkWell(
                        onTap: () {
                          AppState appState = sl();
                          appState.moveToBackScreen();
                        },
                        child: Container(
                          height: 40.h,
                          width: 40.w,
                          child: Icon(
                            Icons.arrow_back,
                            size: 22.sp,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                          ),
                        ),
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: InkWell(
                  onTap: () {
                    AppState appState = sl();
                    appState.goToNext(PageConfigs.paymentOptionPageConfig);
                  },
                  child: CustomiseContainer(
                    title: "Business",
                    subtitle: "Cash",
                    icon: Icons.person,
                    icon2: Icons.keyboard_arrow_right,
                  ),
                ),
              ),
              CustomButton(
                  title: "Request",
                  textcolor: Colors.white,
                  bgColor: Colors.black,
                  ontap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
