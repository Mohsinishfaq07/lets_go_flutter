import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sb_myreports/core/utils/extension/extensions.dart';
import 'package:sb_myreports/features/activity/presentation/pages/activity.dart';
import 'package:sb_myreports/features/around_you.dart';
import 'package:sb_myreports/features/authentication/login/presentation/pages/otp_screen.dart';
import 'package:sb_myreports/features/home_screen/presentation/pages/bottom_navigation_bar.dart';
import 'package:sb_myreports/features/payment_option/presentation/pages/add_payment_method.dart';
import 'package:sb_myreports/features/payment_option/presentation/pages/payment_option.dart';
import 'package:sb_myreports/features/plan_your_trip/presentation/pages/plan_your_trip.dart';
import 'package:sb_myreports/features/saved_places/presentation/pages/saved_places.dart';
import 'package:sb_myreports/features/saved_places/presentation/pages/saved_places_details.dart';
import 'package:sb_myreports/features/schedule_a_trip/presentation/pages/schedule_a_trip.dart';
import '../../features/account/presentation/pages/accessibility_page.dart';
import '../../features/account/presentation/pages/account_page_info.dart';
import '../../features/account/presentation/pages/edit_profile.dart';
import '../../features/account/presentation/pages/email.dart';
import '../../features/account/presentation/pages/first_name.dart';
import '../../features/account/presentation/pages/guide_to_eats.dart';
import '../../features/account/presentation/pages/help.dart';
import '../../features/account/presentation/pages/help_a_trip.dart';
import '../../features/account/presentation/pages/membership.dart';
import '../../features/account/presentation/pages/message.dart';
import '../../features/account/presentation/pages/password.dart';
import '../../features/account/presentation/pages/phone_number.dart';
import '../../features/account/presentation/pages/pin_varification.dart';
import '../../features/account/presentation/pages/ride_check.dart';
import '../../features/account/presentation/pages/safety_checkups.dart';
import '../../features/account/presentation/pages/trusted_contacts.dart';
import '../../features/account/presentation/pages/wallet.dart';
import '../../features/authentication/login/presentation/pages/forgot_password.dart';
import '../../features/authentication/login/presentation/pages/signIn_screen.dart';
import '../../features/authentication/sign_up/presentation/pages/sign_up.dart';
import '../../features/home_screen/presentation/pages/home_screen.dart';

import '../../features/lets_go_driver/driver_cnic/presentation/cnic_back_side/cnic_back_side.dart';
import '../../features/lets_go_driver/driver_cnic/presentation/cnic_front_side/cnic_front_side.dart';
import '../../features/lets_go_driver/presentation/pages/driver_splash_screen.dart';
import '../../features/lets_go_driver/presentation/pages/driving_license/driving_license.dart';
import '../../features/lets_go_driver/presentation/pages/earn_by_driving.dart';
import '../../features/lets_go_driver/presentation/pages/pertner_photo/partner_photo.dart';
import '../../features/lets_go_driver/presentation/pages/terms_and_conditions/terms_and_condition.dart';
import '../../features/lets_go_driver/presentation/pages/vehicle_registration_book/vehicle_registration_book.dart';
import '../../features/lets_go_eats/EatsBottomNavigationBar/presentation/pages/eats_bottom_navigation_bar.dart';
import '../../features/lets_go_eats/eat_authentication/presentation/pages/eats_splash_screen.dart';
import '../../features/lets_go_eats/eat_authentication/presentation/pages/starter.dart';
import '../../features/lets_go_eats/eat_authentication/presentation/pages/starter_detail.dart';

import '../../features/lets_go_eats/eat_dashboard/presentation/pages/eats_dashboard.dart';
import '../../features/lets_go_eats/store_detail_page/presentation/pages/store_detail_page.dart';
import '../../features/plan_your_trip/presentation/pages/add_rider.dart';
import '../../features/plan_your_trip/presentation/pages/new_rider.dart';
import '../../features/saved_places/presentation/pages/saved_places_map_screen.dart';
import '../../features/splash/presentation/pages/LetsGoSplashScreen.dart';
import '../../features/store_detail_page/presentation/pages/store_products.dart';
import '../utils/enums/page_state_enum.dart';
import '../utils/globals/globals.dart';
import 'app_state.dart';
import 'pages.dart';

BuildContext?
    globalHomeContext; // doing this to pop the bottom sheet on home screen

class UremitRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
  late final AppState appState;
  final List<Page> _pages = [];
  late BackButtonDispatcher backButtonDispatcher;

  List<MaterialPage> get pages => List.unmodifiable(_pages);

  UremitRouterDelegate(this.appState) {
    appState.addListener(() {
      notifyListeners();
    });
  }

  @override
  Widget build(BuildContext context) {
    /// Faulty Code will need to find a way to solve it
    appState.globalErrorShow = (value) {
      context.show(message: value);
    };

    return Container(
      key: ValueKey(pages.last.name),
      child: Navigator(
        key: navigatorKeyGlobal,
        onPopPage: _onPopPage,
        pages: buildPages(),
      ),
    );
  }

  List<Page> buildPages() {
    switch (appState.currentAction.state) {
      case PageState.none:
        break;
      case PageState.addPage:
        addPage(appState.currentAction.page!);
        break;
      case PageState.remove:
        removePage(appState.currentAction.page!);
        break;

      case PageState.pop:
        pop();
        break;
      case PageState.addAll:
        // TODO: Handle this case.
        break;
      case PageState.addWidget:
        pushWidget(
            appState.currentAction.widget!, appState.currentAction.page!);
        break;
      case PageState.replace:
        replace(appState.currentAction.page!);
        break;
      case PageState.replaceAll:
        replaceAll(appState.currentAction.page!);
        break;

    }
    return List.of(_pages);
  }


  void replaceAll(PageConfiguration newRoute) {
    _pages.clear();
    setNewRoutePath(newRoute);
  }

  void replace(PageConfiguration newRoute) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    addPage(newRoute);
  }



  /// This method adds pages based on the PageConfig received
  /// [Input]: [PageConfiguration]
  void addPage(PageConfiguration pageConfig) {
    final shouldAddPage =
        _pages.isEmpty || (_pages.last.name != pageConfig.path);

    if (shouldAddPage) {
      switch (pageConfig.uiPage) {
        case Pages.splashPage:
          _addPageData(const LetsGoSplashScreen(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
          case Pages.planYourTrip:
          _addPageData(const PlanYourTrip(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
        case Pages.homeScreen:
          _addPageData(const HomeScreen(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
          case Pages.scheduleATrip:
          _addPageData(const ScheduleATrip(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
          case Pages.savedPlaces:
          _addPageData(const SavedPlaces(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
          case Pages.paymentOption:
          _addPageData(const PaymentOption(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
          case Pages.addPaymentMethod:
          _addPageData(const AddPaymentMethod(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
          case Pages.savedPlacesDetail:
          _addPageData(const SavedPlacesDetail(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
          case Pages.aroundYou:
          _addPageData(const AroundYou(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
          case Pages.bottomNavigationBarScreen:
          _addPageData(const BottomNavigationBarScreen(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
          case Pages.activityScreen:
          _addPageData(const ActivityScreen(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
          case Pages.addRiderScreen:
          _addPageData(const AddRiderScreen(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
          case Pages.newRiderScreen:
          _addPageData(const NewRiderScreen(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
          case Pages.savedPlacesMapScreen:
          _addPageData(const SavedPlacesMapScreen(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
          case Pages.starter:
          _addPageData(const StarterScreen(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
          case Pages.starterDetail:
          _addPageData( const StarterDetail(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
          case Pages.storeDetailPage:
          _addPageData( const StoreDetailPage(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
          case Pages.eatsSplashScreen:
          _addPageData( const EatsSplashScreen(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
          // case Pages.eatsDashboardScreen:
          // _addPageData( const EatsDashboardScreen(), pageConfig);
          // // _addPageData(const DashboardPage(), pageConfig);
          // break;
          case Pages.eatsBottomNavigationBarScreen:
          _addPageData( const EatsBottomNavigationBarScreen(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
          case Pages.signInScreen:
          _addPageData( const SignInScreen(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
          case Pages.signUpScreen:
          _addPageData(  SignUpScreen(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
          case Pages.otpScreen:
          _addPageData( const OTPScreen(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
          case Pages.forgotPassword:
          _addPageData( const ForgotPassword(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
        case Pages.editProfile:
          _addPageData(const EditProfile(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;






        case Pages.firstName:
          _addPageData(const FirstName(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
        case Pages.phoneNumber:
          _addPageData(const PhoneNumber(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
        case Pages.passwordContent:
          _addPageData(const PasswordContent(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
        case Pages.emailContent:
          _addPageData(const EmailContent(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
        case Pages.helpATrip:
          _addPageData(const HelpATrip(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
        case Pages.account:
          _addPageData(const Account(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
        case Pages.membership:
          _addPageData(const MembershipAndLoyalty(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
        case Pages.guideToEats:
          _addPageData(const GuideToEats(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
        case Pages.accessibility:
          _addPageData(const Accessibility(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
        case Pages.safetyCheckup:
          _addPageData(const SafetyCheckup(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
        case Pages.message:
          _addPageData(const Message(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;

        case Pages.rideCheckPage:  _addPageData(const RideCheckContent(),
            pageConfig);
        break;case Pages.pinVerificationPage:
        _addPageData(const PinVerificationContent(), pageConfig);

        break;
        case Pages.trustedContactPage:
          _addPageData(const TrustedContact(),
              pageConfig);
          break;



        // case Pages.planYourEatsLocation:
        //   _addPageData(const PlanYourEatsLocation(), pageConfig);
        //   // _addPageData(const DashboardPage(), pageConfig);
        //   break;
        case Pages.wallet:
          _addPageData(const WalletScreen(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
        case Pages.help:
          _addPageData(const HelpScreen(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;
        case Pages.storeProducts:
          _addPageData(const StoreProducts(), pageConfig);
          // _addPageData(const DashboardPage(), pageConfig);
          break;




        case Pages.earnByDrivingPage:
          _addPageData(const EarnByDrivingContent(), pageConfig);
      // _addPageData(const DashboardPage(), pageConfig);
      break;
        case Pages.termsAndConditionsPage:
          _addPageData(const TermsAndConditionsContent(), pageConfig);
      // _addPageData(const DashboardPage(), pageConfig);
      break;
        case Pages.cNICBackSidePage:
          _addPageData(const CNICBackSideContent(), pageConfig);
      // _addPageData(const DashboardPage(), pageConfig);
      break;
        case Pages.cNICFrontSidePage:
          _addPageData(const CNICFrontSideContent(), pageConfig);
      // _addPageData(const DashboardPage(), pageConfig);
      break;
        case Pages.partnerPhotoPage:
          _addPageData(const PartnerPhotoContent(), pageConfig);
      // _addPageData(const DashboardPage(), pageConfig);
      break;
        case Pages.drivingLicenseFrontSidePage:
          _addPageData(const DrivingLicenseFrontSideContent(), pageConfig);
      // _addPageData(const DashboardPage(), pageConfig);
      break;
        case Pages.vehicleRegistrationBookPage:
          _addPageData(const VehicleRegistrationBookContent(), pageConfig);
      // _addPageData(const DashboardPage(), pageConfig);
      break;

      case Pages.driveSplashScreen:
          _addPageData(const DriveSplashScreen(), pageConfig);
      // _addPageData(const DashboardPage(), pageConfig);
      break;


      }
    }
  }

  void _addPageData(Widget child, PageConfiguration pageConfig) {
    _pages.add(
      _createPage(child, pageConfig),
    );
  }

  void pushWidget(Widget child, PageConfiguration newRoute) {
    _addPageData(child, newRoute);
  }
  MaterialPage _createPage(Widget child, PageConfiguration pageConfig) {
    return MaterialPage(
        child: child,
        key: ValueKey(pageConfig.key),
        name: pageConfig.path,
        arguments: pageConfig);
  }

  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);

    if (!didPop) {
      return false;
    }
    if (canPop()) {
      pop();
      return true;
    } else {
      return false;
    }
  }

  void pop() {
    if (globalHomeContext != null) {
      Navigator.of(globalHomeContext!).pop();
      globalHomeContext = null;
      return;
    }
    if (canPop()) {
      _removePage(_pages.last as MaterialPage);
    } else {
      // if (_pages.last.name != PagePaths.authWrapperPagePath) {
      //   _homeViewModel.onBottomNavTap(0);
      // }
    }
  }
  void removePage(PageConfiguration page) {
    if (_pages.isNotEmpty) {
      int index = _pages.indexWhere((element) => element.name == page.path);
      if (index != -1) {
        _pages.removeAt(index);
      }
    }
  }

  void _removePage(MaterialPage page) {
    _pages.remove(page);
    // notifyListeners();
  }

  bool canPop() {
    return _pages.length > 1;
  }

  @override
  Future<bool> popRoute() {
    if (canPop()) {
      _removePage(_pages.last as MaterialPage);
      return Future.value(true);
    }
    return Future.value(false);
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) {
    final shouldAddPage =
        _pages.isEmpty || (_pages.last.name != configuration.path);

    if (!shouldAddPage) {
      return SynchronousFuture(null);
    }
    _pages.clear();
    addPage(configuration);

    return SynchronousFuture(null);
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => navigatorKeyGlobal;
}
