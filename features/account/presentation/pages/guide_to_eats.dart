import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/router/app_state.dart';

import '../../../../core/router/models/page_config.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../../core/widgets/custom/custom_list.dart';
import 'help_a_trip.dart';

class GuideToEats extends StatelessWidget {
  const GuideToEats({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const AGuideToEatsContent();
  }
}

class AGuideToEatsContent extends StatefulWidget {
  const AGuideToEatsContent({Key? key}) : super(key: key);
  @override
  State<AGuideToEatsContent> createState() => _AGuideToEatsContentState();
}

class _AGuideToEatsContentState extends State<AGuideToEatsContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        expandedHeight: 90.sp,
        backgroundColor: Colors.black,
        flexibleSpace: const FlexibleSpaceBar(
          title: Text(
            'Help',
            textScaleFactor: 1,
            textAlign: (TextAlign.start),
          ),
        ),
        pinned: true,
      ),
      SliverList(
        delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'A guide to Uber',
                  style: TextStyle(fontSize: 25.sp),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomList(
                  title: "Signing up",
                  trailing: Icons.arrow_forward_ios_sharp,
                  onTap: () {

                    AppState appState =sl ();
                    appState.goToNext(PageConfigs.helpATripPageConfig);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomList(
                  title: 'Getting started',
                  trailing: Icons.arrow_forward_ios_sharp,
                  onTap: () {},
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomList(
                  title: 'From pickup to dropoff',
                  trailing: Icons.arrow_forward_ios_sharp,
                  onTap: () {},
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomList(
                  title: 'Policies',
                  trailing: Icons.arrow_forward_ios_sharp,
                  onTap: () {},
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomList(
                  title: 'Data and fees',
                  trailing: Icons.arrow_forward_ios_sharp,
                  onTap: () {},
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomList(
                  title: 'Uber for delivery',
                  trailing: Icons.arrow_forward_ios_sharp,
                  onTap: () {},
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomList(
                  title: 'Uber for business travel',
                  trailing: Icons.arrow_forward_ios_sharp,
                  onTap: () {},
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomList(
                  title: 'Uber safety measures',
                  trailing: Icons.arrow_forward_ios_sharp,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ]),
      ),
    ]));
  }
}
