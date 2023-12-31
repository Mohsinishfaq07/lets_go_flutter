// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'package:sb_myreports/features/google_place_api/presentation/manager/place_api_seervice.dart';
//
// class PlaceProvider extends ChangeNotifier {
//   late final Completer<GoogleMapController> googleMapCompleter;
//   //* Properties.................................................................
//   // External Services
//   late LocationService locationService;
//   late PlaceApiProviderService apiClient;
//   late GoogleMapControllerUtils mapUtils;
//   // Objects
//   late final loc.LocationData currentLocationData;
//   late Result placeDetails;
//   late List<Predictions> predlist;
//   late loc.Location currentLocation;
//   // Google Map Properties
//   late GoogleMapController googleMapController;
//   late List<LatLng> routeCordinates;
//   final Set<Polyline> polyline = {};
//   late final Set<Marker> mapMarkers = {};
//   // Loaders
//   bool googleCamerautilsControllerIsInitilized = false;
//   ///[Default] camera position for google maps
//   LatLng initialcameraPosition =
//   const LatLng(37.42796133580664, -122.085749655962);
//   /// initilizing fields in [Constructor]
//   PlaceProvider() {
//     apiClient = PlaceApiProviderService();
//     locationService = LocationService();
//     googleMapCompleter = Completer<GoogleMapController>();
//   }
//   //* Funcations ...............................................................................
//   //! Call this function must in Google Maps screen [init] state
//   Future<void> initilizeCompleter() async {
//     googleMapController = await googleMapCompleter.future;
//   }
//   /// It will listen to [location Changes], Call this function must in Google Map [On Map created]
//   void onMapCreated(GoogleMapController googleMapController) {
//     mapUtils.googleMapController = googleMapController;
//     locationService.getLocationIns.onLocationChanged.listen((l) {
//       googleMapController.animateCamera(
//         CameraUpdate.newCameraPosition(
//           CameraPosition(target: LatLng(l.latitude!, l.longitude!), zoom: 15),
//         ),
//       );
//     });
//   }
//   /// Get list of [Search places] suggestions
//   Future<List<Predictions>> getPredictions(String pattern) async {
//     predlist = await apiClient.fetchSuggestions(pattern, 'en');
//     return predlist;
//   }
//   /// Get detail of [Selected] place, From list of suggestions
//   Future<void> getPlaceDetails(String placeId) async {
//     placeDetails = await apiClient.getPlaceDetailFromId(placeId);
//     //Calculating Latlang for origin
//     LatLng origin =
//     LatLng(currentLocationData.latitude!, currentLocationData.longitude!);
//     //Calculating Latlang for destination
//     LatLng destination = LatLng(
//         placeDetails.geometry.location.lat, placeDetails.geometry.location.lng);
//     getPolyLines(origin, destination, placeId);
//     notifyListeners();
//   }
//   /// Move Camera to a [specific location]
//   //? Input => latitute
//   Future<void> goToPlace(LatLng position) async {
//     googleMapController.animateCamera(CameraUpdate.newCameraPosition(
//         CameraPosition(target: position, zoom: 12)));
//   }
//   /// Draw polyline between [Origin & Destination]
//   //? Input => LatLng of origin and Destination place
//   Future<void> getPolyLines(
//       LatLng origin, LatLng destination, String placeId) async {
//     routeCordinates = (await apiClient.getPolyLines(origin, destination))!;
//     polyline.add(Polyline(
//       polylineId: PolylineId(placeId),
//       visible: true,
//       points: routeCordinates,
//       width: 4,
//       color: Colors.blue,
//       startCap: Cap.roundCap,
//       endCap: Cap.buttCap,
//     ));
//     notifyListeners();
//   }
//   /// Add markers on given [Position]
//   //? Input => Latlang of that position
//   Future<void> setMarkerOnMap(String markerId, LatLng position) async {
//     mapMarkers.add(Marker(
//         icon: BitmapDescriptor.defaultMarker,
//         markerId: MarkerId(markerId),
//         position: position));
//     notifyListeners();
//   }
//   /// Get location of [Device]
//   //? Must Call in the start
//   Future<void> getLocationOnce() async {
//     googleCamerautilsControllerIsInitilized = false;
//     currentLocationData = await locationService.getLoc();
//     /// Giving [Current Location ] to GoogleMapUtilsController
//     LatLng currentLocationLatlang =
//     LatLng(currentLocationData.latitude!, currentLocationData.longitude!);
//     mapUtils = GoogleMapControllerUtils(
//       currentLocationLatlang,
//     );
//     googleCamerautilsControllerIsInitilized = true;
//     /// Listining to location chnages
//     locationService.getLocationIns.onLocationChanged
//         .listen((LocationData currentLocation) {
//       initialcameraPosition = currentLocationLatlang;
//       setMarkerOnMap(
//           currentLocationData.time.toString(), currentLocationLatlang);
//     });
//   }
//   void onCameraMove(CameraPosition position) {
//     mapUtils.currentCamPosition = position;
//   }
//   void onMapTypeChange(int value) {
//     mapUtils.selectedMap = value;
//     notifyListeners();
//   }
// }