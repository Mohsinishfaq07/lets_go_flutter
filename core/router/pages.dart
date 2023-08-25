import 'package:equatable/equatable.dart';

class PageConfiguration extends Equatable {
  final String key;
  final String path;
  final Pages uiPage;
  final Map<String, dynamic> arguments;

  const PageConfiguration({
    required this.key,
    required this.path,
    required this.uiPage,
    this.arguments = const {},
  });
  factory PageConfiguration.withArguments(PageConfiguration pageConfiguration, Map<String, dynamic> arguments) {
    return PageConfiguration(uiPage: pageConfiguration.uiPage, key: pageConfiguration.key, path: pageConfiguration.path, arguments: arguments);
  }
  @override
  List<Object?> get props => [key, path, uiPage, arguments];
}

enum Pages {
  splashPage,
  planYourTrip,
  homeScreen,
  scheduleATrip,
  savedPlaces,savedPlacesMapScreen,
  paymentOption,
  addPaymentMethod,
  savedPlacesDetail,
  aroundYou,
  bottomNavigationBarScreen,
  activityScreen,
  addRiderScreen,
  newRiderScreen,
  starter,
  starterDetail,
  storeDetailPage,
  eatsSplashScreen,
  eatsDashboardScreen,
  eatsBottomNavigationBarScreen,
  signInScreen,
  signUpScreen,
  otpScreen,
  forgotPassword,
  editProfile,
  registrationScreen,
  firstName,
  phoneNumber,
  passwordContent,
  emailContent,
  helpATrip,
  account,
  membership,
  guideToEats,
  accessibility,
  safetyCheckup,
  message,
  rideCheckPage,
  pinVerificationPage,
  trustedContactPage,
  wallet,
  help,
  storeProducts,
  earnByDrivingPage,
  termsAndConditionsPage,
  cNICBackSidePage,
  cNICFrontSidePage,
  partnerPhotoPage,
  drivingLicenseFrontSidePage,
  vehicleRegistrationBookPage,
  driveSplashScreen,



}
