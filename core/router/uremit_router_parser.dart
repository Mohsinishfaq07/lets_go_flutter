import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'models/page_config.dart';
import 'models/page_paths.dart';
import 'pages.dart';

class UremitRouterParser extends RouteInformationParser<PageConfiguration> {
  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) {
    final uri = Uri.parse(routeInformation.location ?? '');

    if (uri.pathSegments.isEmpty) {
      return SynchronousFuture(PageConfigs.splashPageConfig);
    }

    final path = '/' + uri.pathSegments[0];

    switch (path) {
      case PagePaths.splashPagePath:
        return SynchronousFuture(PageConfigs.splashPageConfig);
      default:
        return SynchronousFuture(PageConfigs.splashPageConfig);
    }
  }

  @override
  RouteInformation restoreRouteInformation(PageConfiguration configuration) {
    switch (configuration.uiPage) {
      case Pages.splashPage:
        return const RouteInformation(location: PagePaths.splashPagePath);
      case Pages.planYourTrip:
        return const RouteInformation(location: PagePaths.planYourTripPagePath);
      case Pages.homeScreen:
        return const RouteInformation(location: PagePaths.homeScreenPagePath);
      case Pages.scheduleATrip:
        return const RouteInformation(
            location: PagePaths.scheduleATripPagePath);
        case Pages.savedPlaces:
        return const RouteInformation(
            location: PagePaths.savedPlacesPagePath);
        case Pages.paymentOption:
        return const RouteInformation(
            location: PagePaths.paymentOptionPagePath);
        case Pages.addPaymentMethod:
        return const RouteInformation(
            location: PagePaths.addPaymentMethodPagePath);
        case Pages.savedPlacesDetail:
        return const RouteInformation(
            location: PagePaths.savedPlacesDetailPagePath);
        case Pages.aroundYou:
        return const RouteInformation(
            location: PagePaths.aroundYouPagePath);
        case Pages.bottomNavigationBarScreen:
        return const RouteInformation(
            location: PagePaths.bottomNavigationBarScreenPagePath);
        case Pages.activityScreen:
        return const RouteInformation(
            location: PagePaths.activityScreenPagePath);
        case Pages.addRiderScreen:
        return const RouteInformation(
            location: PagePaths.addRiderScreenPagePath);
        case Pages.newRiderScreen:
        return const RouteInformation(
            location: PagePaths.newRiderScreenPagePath);
        case Pages.savedPlacesMapScreen:
        return const RouteInformation(
            location: PagePaths.savedPlacesMapScreenPagePath);
        case Pages.starter:
        return const RouteInformation(
            location: PagePaths.starterScreenPagePath);
        case Pages.starterDetail:
        return const RouteInformation(
            location: PagePaths.starterDetailScreenPagePath);
        case Pages.storeDetailPage:
        return const RouteInformation(
            location: PagePaths.storeDetailScreenPagePath);
        case Pages.eatsSplashScreen:
        return const RouteInformation(
            location: PagePaths.eatsSplashScreenPagePath);
        case Pages.eatsDashboardScreen:
        return const RouteInformation(
            location: PagePaths.eatsDashboardScreenPagePath);
        case Pages.eatsBottomNavigationBarScreen:
        return const RouteInformation(
            location: PagePaths.eatsBottomNavigationBarScreenPagePath);
        case Pages.signInScreen:
        return const RouteInformation(
            location: PagePaths.signInScreenPagePath);
        case Pages.signUpScreen:
        return const RouteInformation(
            location: PagePaths.signUpScreenPagePath);
        case Pages.otpScreen:
        return const RouteInformation(
            location: PagePaths.otpScreenPagePath);
        case Pages.forgotPassword:
        return const RouteInformation(
            location: PagePaths.forgotPasswordPagePath);
      case Pages.editProfile:
        return const RouteInformation(location: PagePaths.editProfileScreenPagePath);



      case Pages.splashPage:
        return const RouteInformation(location: PagePaths.splashPagePath);
      case Pages.registrationScreen:
        return const RouteInformation(location: PagePaths.registrationScreenPagePath);
      case Pages.otpScreen:
        return const RouteInformation(location: PagePaths.otpScreenPagePath);
      case Pages.forgotPassword:
        return const RouteInformation(location: PagePaths.forgotPasswordPagePath);
      case Pages.eatsBottomNavigationBarScreen:
        return const RouteInformation(location: PagePaths.eatsBottomNavigationBarScreenPagePath);
      case Pages.editProfile:
        return const RouteInformation(location: PagePaths.editProfileScreenPagePath);

      case Pages.firstName:
        return const RouteInformation(location: PagePaths.firstNamePagePath);
      case Pages.phoneNumber:
        return const RouteInformation(location: PagePaths.phoneNumberPagePath);

      case Pages.passwordContent:
        return const RouteInformation(location: PagePaths.passwordContentPagePath);




      case Pages.emailContent:
        return const RouteInformation(location: PagePaths.emailContentPagePath);

      case Pages.helpATrip:
        return const RouteInformation(location: PagePaths.helpATripPagePath);
      case Pages.account:
        return const RouteInformation(location: PagePaths.accountPagePath);
      case Pages.membership:
        return const RouteInformation(location: PagePaths.membershipPagePath);
      case Pages.guideToEats:
        return const RouteInformation(location: PagePaths.guideToEatsPagePath);
      case Pages.accessibility:
        return const RouteInformation(location: PagePaths.accessibilityPagePath);

      case Pages.safetyCheckup:
        return const RouteInformation(location: PagePaths.SafetyCheckupPagePath);

      case Pages.message:
        return const RouteInformation(location: PagePaths.messagePagePath);
      case Pages.rideCheckPage:
        return const RouteInformation(location: PagePaths.rideCheckPagePath);
      case Pages.pinVerificationPage:
        return const RouteInformation(location: PagePaths.pinVerificationPagePath);
      case Pages.trustedContactPage:
        return const RouteInformation(location:
        PagePaths.trustedContactPagePath);

      case Pages.addRiderScreen:
        return const RouteInformation(
            location: PagePaths.addRiderScreenPagePath);
      case Pages.newRiderScreen:
        return const RouteInformation(
            location: PagePaths.newRiderScreenPagePath);
      case Pages.planYourTrip:
        return const RouteInformation(location: PagePaths.planYourTripPagePath);

      case Pages.savedPlacesMapScreen:
        return const RouteInformation(
            location: PagePaths.savedPlacesMapScreenPagePath);

      case Pages.help:
        return const RouteInformation(
            location: PagePaths.helpPagePath);



      case Pages.wallet:
        return const RouteInformation(
            location: PagePaths.walletPagePath);
      case Pages.storeProducts:
        return const RouteInformation(
            location: PagePaths.storeProductsPagePath);
      case Pages.signUpScreen:
        return const RouteInformation(
            location: PagePaths.signUpScreenPagePath);



      case Pages.earnByDrivingPage:
        return const RouteInformation(location: PagePaths.earnByDrivingPagePath);
      case Pages.termsAndConditionsPage:
        return const RouteInformation(location: PagePaths.termsAndConditionsPagePath);
      case Pages.cNICBackSidePage:
        return const RouteInformation(location: PagePaths.cNICBackSidePagePath);
      case Pages.cNICFrontSidePage:
        return const RouteInformation(location: PagePaths.cNICFrontSidePagePath);
      case Pages.partnerPhotoPage:
        return const RouteInformation(location: PagePaths.partnerPhotoPagePath);
      case Pages.drivingLicenseFrontSidePage:
        return const RouteInformation(location: PagePaths.drivingLicenseFrontSidePagePath);
      case Pages.vehicleRegistrationBookPage:
        return const RouteInformation(location: PagePaths.vehicleRegistrationBookPagePath);



case Pages.driveSplashScreen:
        return const RouteInformation(location: PagePaths.driveSplashScreenPagePath);







    }
  }
}
