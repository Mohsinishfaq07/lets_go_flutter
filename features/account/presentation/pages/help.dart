import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/router/app_state.dart';
import '../../../../../core/router/models/page_config.dart';
import '../../../../../core/utils/globals/globals.dart';
import '../../../../core/widgets/custom/custom_list.dart';
class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);
  @override  Widget build(BuildContext context) {
    return const HelpScreenContent();
  }
}
class HelpScreenContent extends StatefulWidget {
  const HelpScreenContent({Key? key}) : super(key: key);
  @override  State<HelpScreenContent> createState() => _HelpScreenContentState();
}
class _HelpScreenContentState extends State<HelpScreenContent> {
  @override  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 100.sp,
                backgroundColor: Colors.black,
                flexibleSpace: const FlexibleSpaceBar(
                  title: Text('Help',textScaleFactor: 1,textAlign: (TextAlign.start),),
                ),
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding:  EdgeInsets.only(top: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('All Topics',style: TextStyle(color: (Colors.black54)),),
                              SizedBox(
                                height: 33.h,
                              ),
                              CustomList(
                                title: 'Help with a trip',
                                trailing: Icons.arrow_forward_ios_sharp,
                                onTap: (){
                                  AppState appState = sl();
                                  appState.goToNext(PageConfigs.helpATripPageConfig);
                                },
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              CustomList(
                                title: 'Account',
                                trailing: Icons.arrow_forward_ios_sharp,
                                onTap: (){
                                  AppState appState = sl();
                                  appState.goToNext(PageConfigs.accountPageConfig);
                                },
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              CustomList(
                                title: 'Membership and loyalty',
                                trailing: Icons.arrow_forward_ios_sharp,
                                onTap: (){
                                  AppState appState = sl();
                                  appState.goToNext(PageConfigs.membershipPageConfig);
                                },
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              CustomList(
                                title: 'A guide to Uber',
                                trailing: Icons.arrow_forward_ios_sharp,
                                onTap: (){
                                  AppState appState = sl();
                                  appState.goToNext(PageConfigs.guideToEatsPageConfig);
                                },
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              CustomList(
                                title: 'Accessibility',
                                trailing: Icons.arrow_forward_ios_sharp,
                                onTap: (){
                                  AppState appState = sl();
                                  appState.goToNext(PageConfigs.accessibilityPageConfig);
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            ]
        )
    );
  }
}