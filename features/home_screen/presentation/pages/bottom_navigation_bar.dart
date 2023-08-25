import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/router/app_state.dart';
import '../../../../core/router/models/page_config.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../account/presentation/pages/account_screen.dart';
import '../../../activity/presentation/pages/activity.dart';
import 'home_screen.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BottomNavigationBarContent();
  }
}

class BottomNavigationBarContent extends StatefulWidget {
  const BottomNavigationBarContent({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarContent> createState() =>
      _BottomNavigationBarContentState();
}

class _BottomNavigationBarContentState
    extends State<BottomNavigationBarContent> {
  List<Widget> page = [
    const HomeScreen(),
    const ActivityScreen(),
    const AccountScreen(),
  ];
  ValueNotifier<int> currentPageIndexNotifier = ValueNotifier(0);
  final PageController pageController = PageController(initialPage: 0);

  /// Local Methods
  changePageIndex(int index) {
    currentPageIndexNotifier.value = index;
    if (index > 1) {
      pageController.animateToPage(index,
          duration: const Duration(seconds: 1), curve: Curves.easeInOutQuad);
    } else {
      pageController.animateToPage(index,
          duration: const Duration(seconds: 1), curve: Curves.easeInOutQuad);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: pageController,
          physics: const ScrollPhysics(),
          children: page,
        ),
        extendBody: true,
        bottomNavigationBar: ValueListenableBuilder(
            valueListenable: currentPageIndexNotifier,
            builder: ((context, value, child) {
              return SizedBox(
                height: 73.h,
                child: BottomNavigationBar(
                  currentIndex: currentPageIndexNotifier.value,
                  backgroundColor: Colors.white,
                  unselectedItemColor: Colors.grey,
                  selectedItemColor: Colors.black,
                  onTap: (index) {
                    changePageIndex(index);
                  },
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        activeIcon: Icon(
                          Icons.home_filled,
                          color: Colors.black,
                          size: 30.sp,
                        ),
                        backgroundColor: Colors.white,
                        icon: Icon(
                          Icons.home_filled,
                          color: Colors.grey,
                          size: 30.sp,
                        ),
                        label: "Home"),
                    BottomNavigationBarItem(
                        activeIcon: InkWell(
                          onTap: () {
                            AppState appState = sl();
                            appState
                                .goToNext(PageConfigs.activityScreenPageConfig);
                          },
                          child: InkWell(
                            onTap: () {
                              AppState appState = sl();
                              appState.goToNext(
                                  PageConfigs.activityScreenPageConfig);
                            },
                            child: const Icon(
                              Icons.library_books,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ),
                        icon: const Icon(
                          Icons.library_books,
                          color: Colors.grey,
                          size: 30,
                        ),
                        label: 'Activity'),
                    BottomNavigationBarItem(
                        activeIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 30.sp,
                        ),
                        icon: Icon(
                          Icons.person,
                          size: 30.sp,
                          color: Colors.grey,
                        ),
                        label: 'Account'),
                  ],
                ),
              );
            })));
  }
}
