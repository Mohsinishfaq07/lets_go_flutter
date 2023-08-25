
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sb_myreports/core/utils/enums/page_state_enum.dart';
import 'package:sb_myreports/features/plan_your_trip/presentation/manager/place_provider.dart';
import '../../../../core/router/app_state.dart';
import '../../../../core/router/models/page_config.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../../core/widgets/custom/custom_lets_go_container.dart';
import '../widgets/date_time_bottom_sheets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeScreenContent();
  }
}

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({Key? key}) : super(key: key);

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  PolylinePoints polylinePoints = PolylinePoints();

  String googleAPiKey = "AIzaSyAHds4B2chfSDPt9UED1J4BUzWy6P-9J_w";

  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  late GoogleMapController googleMapController;

  /// Valuenotifiers
  final PageController pageController = PageController();
  PlacesProvider placeProvider=sl();

  ValueNotifier currentPageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {

    List<String> pages = [
      AppAssets.car,
      AppAssets.car1];
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h,),
                  Container(
                      height: 150.h,
                      padding: EdgeInsets.symmetric(horizontal: 12.h),
                      child: PageView.builder(
                          onPageChanged: (value) {
                            currentPageIndex.value = value;
                          },
                          controller: pageController,
                          itemCount: pages.length,
                          itemBuilder: ((context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: InkWell(
                                onTap: () {
                                  AppState appState = sl();
                                  appState.goToNext(
                                      PageConfigs.eatsSplashScreenPageConfig);
                                },
                                child: Card(
                                  elevation: 10,
                                  child: Center(
                                    child: Image.asset(
                                      pages[index],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }))),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical:20.h, horizontal: 14.w),
                    child: Container(
                      height: 56.h,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(40.r)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                AppState appState = sl();
                                appState.goToNext(
                                    PageConfigs.planYourTripPageConfig);
                              },
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 6,right: 10),
                                    child: Icon(
                                      Icons.search,
                                      size: 37.h,
                                    ),
                                  ),
                              ValueListenableBuilder<String?>(
                                valueListenable: placeProvider.sourceLocation,
                                builder: (context, value, child) =>
                                    Text(
                                      value==null?"Enter pick-up point":value!,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),
                                  ),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 10.h),
                              child: const VerticalDivider(
                                  color: Colors.grey, thickness: 1),
                            ),
                            InkWell(
                              onTap: () {
                               DateTimeBottomSheet().show();

                              },
                              child: Container(
                                height: 36.h,
                                width: 110.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Icon(
                                        Icons.access_time_filled_outlined,
                                        size: 20,
                                      ),
                                      Text(
                                        "Now",
                                        style: TextStyle(fontSize: 13.sp),
                                      ),
                                      Icon(Icons.swipe_down_alt_outlined,size: 20.sp,),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  ValueListenableBuilder<String?>(
                    valueListenable: placeProvider.savedLocation,
                    builder: (context, value, child) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 8.w),
                      child: InkWell(
                        onTap: () {
                          AppState appState = sl();
                          appState.goToNext(PageConfigs.savedPlacesPageConfig);
                        },
                        child: CustomiseContainer(
                          icon2: Icons.navigate_next,
                          title: 'Chose a saved Place',
                          icon: Icons.star,
                          subtitle:value==null?"Select location":value!,
                        ),
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 68.0),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
            ValueListenableBuilder<String?>(
                valueListenable: placeProvider.savedLocation,
                builder: (context, value, child) =>
                    Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.h,
                      horizontal: 8.w
                    ),
                    child: InkWell(
                      onTap: () {
                        AppState appState = sl();
                        appState.goToNext(PageConfigs.savedPlacesMapScreenPageConfig);
                      },
                      child: CustomiseContainer(
                          icon2: Icons.navigate_next,
                          title: 'Set destination on map ',
                          icon: Icons.location_on_rounded,
                        subtitle:value==null?"destination ":value!,),
                    ),
                  ),),

                  const Padding(
                    padding: EdgeInsets.only(left: 68.0, bottom: 10),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Around You ",
                          style: (TextStyle(fontSize: 18.sp)),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: SizedBox(
                            height: 200.h,
                            width: 400.w,
                            child: InkWell( onTap: () {

                              AppState appState = sl();
                              appState
                                  .goToNext(PageConfigs.aroundYouPageConfig,pageState: PageState.replace);
                            },
                              child: IgnorePointer(
                                child: GoogleMap(
                                  mapType: MapType.normal,
                                  initialCameraPosition: _kGooglePlex,
                                  onMapCreated: (GoogleMapController controller) {
                                    _controller.complete(controller);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h,),
                      ],
                    ),
                  ),

                  // yha s shuru h

                ]),
          ),
        ));
  }
}
