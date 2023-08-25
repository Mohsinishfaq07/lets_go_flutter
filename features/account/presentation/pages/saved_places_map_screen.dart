import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../core/router/app_state.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../../core/widgets/custom/custom_form_field.dart';
import '../../../../core/widgets/custom/customise_button.dart';
import '../../../plan_your_trip/presentation/manager/place_provider.dart';

class SavedPlacesMapScreen extends StatelessWidget {
  const SavedPlacesMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SavedPlacesMapScreenContent();
  }
}

class SavedPlacesMapScreenContent extends StatefulWidget {
  const SavedPlacesMapScreenContent({Key? key}) : super(key: key);

  @override
  State<SavedPlacesMapScreenContent> createState() =>
      _SavedPlacesMapScreenContentState();
}

class _SavedPlacesMapScreenContentState
    extends State<SavedPlacesMapScreenContent> {
  final TextEditingController sourceController = TextEditingController();
  // final TextEditingController destinationController = TextEditingController();
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng sourceLocation =
  LatLng(33.55743916688042, 73.15531231558587);
  static const LatLng destinationLocation =
  LatLng(32.088462089241595, 72.65780618961055);
  static const LatLng currentLocation =
  LatLng(32.089885118736184, 72.66115824594768);



  PlacesProvider provider = sl();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: provider,
        child: Builder(builder: (context) {
          return
            Scaffold(
              body: SafeArea(
                child: Column(
                  // mainAxisSize: MainAxisSize.max,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 60,
                      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(1, 2),
                            color: Colors.black12)
                      ]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  AppState appState = sl();
                                  appState.moveToBackScreen();
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 32.sp,
                                )),
                            SizedBox(
                              width: 6.w,
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                textInputAction: TextInputAction.done,
                                maxLines: 1,
                                labelText: "",
                                controller: sourceController,
                                onFieldSubmitted: (val) async {
                                  print("hererer   "+val);
                                  provider.getQueryPlace(
                                      val, await _controller.future);
                                },



                                hintText: "AppInSnap.com",),
                            ),
                          ],
                        ),
                      ),
                      //const Divider(thickness: 2,)
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          SizedBox(
                              child:GoogleMap(
                                  onMapCreated:
                                      (GoogleMapController
                                  controller) {
                                    _controller
                                        .complete(
                                        controller);
                                  },
                                  myLocationEnabled:
                                  true,
                                  trafficEnabled: true,
                                  zoomControlsEnabled:
                                  true,
                                  zoomGesturesEnabled:
                                  true,
                                  mapType:
                                  MapType.normal,
                                  compassEnabled: true,
                                  myLocationButtonEnabled:
                                  true,
                                  initialCameraPosition:
                                  CameraPosition(
                                    target: LatLng(
                                        currentLocation
                                            .latitude,
                                        currentLocation
                                            .longitude),
                                    zoom: 10,
                                  ),
                                  // polylines: {
                                  //   Polyline(
                                  //       polylineId:
                                  //       const PolylineId(
                                  //           "route"),
                                  //       points:
                                  //       polylinesCoordinates,
                                  //       width: 6,
                                  //       color: Colors
                                  //           .blue)
                                  // },
                                  markers: {
                                    Marker(
                                      markerId:
                                      const MarkerId(
                                          'Current Location'),
                                      position: LatLng(
                                          currentLocation
                                              .latitude,
                                          currentLocation
                                              .longitude),
                                      infoWindow:
                                      (const InfoWindow(
                                          title:
                                          "Current  position ")),
                                    ),
                                    Marker(
                                      markerId:
                                      const MarkerId(
                                          'source'),
                                      position: LatLng(
                                          sourceLocation
                                              .latitude,
                                          sourceLocation
                                              .longitude),
                                      infoWindow:
                                      (const InfoWindow(
                                          title:
                                          "Source position ")),
                                    ),
                                    Marker(
                                      markerId:
                                      const MarkerId(
                                          'destination'),
                                      position: LatLng(
                                          destinationLocation
                                              .latitude,
                                          destinationLocation
                                              .longitude),
                                      infoWindow:
                                      (const InfoWindow(
                                          title:
                                          "Destination  position ")),
                                    ),
                                  }
                              )),
                          Positioned(
                              bottom: 10,
                              right: 0,
                              left: 0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: CustomButton(
                                  title: 'Done',
                                  textcolor: Colors.white,
                                  bgColor: Colors.black,
                                  ontap: () {
                                    AppState appState = sl();
                                    appState.moveToBackScreen();
                                  },
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
        }));
  }
}

