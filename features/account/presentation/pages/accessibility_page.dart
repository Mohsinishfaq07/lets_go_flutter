import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/router/app_state.dart';
import '../../../../../../core/router/models/page_config.dart';
import '../../../../../../core/utils/globals/globals.dart';
import '../../../../core/widgets/custom/custom_list.dart';

class Accessibility extends StatelessWidget {
  const Accessibility({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const AccessibilityContent();
  }
}

class AccessibilityContent extends StatefulWidget {
  const AccessibilityContent({Key? key}) : super(key: key);
  @override
  State<AccessibilityContent> createState() => _AccessibilityContentState();
}

class _AccessibilityContentState extends State<AccessibilityContent> {
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Accessibility',
                      style: TextStyle(fontSize: 25.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomList(
                      title: 'Resources for riders with\ndisability',
                      trailing: Icons.arrow_forward_ios_sharp,
                      onTap: () {
                        AppState appState = sl();
                        appState.goToNext(PageConfigs.helpATripPageConfig);
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomList(
                      title: 'Using TalkBack and VoiceOver',
                      trailing: Icons.arrow_forward_ios_sharp,
                      onTap: () {
                        AppState appState = sl();
                        appState.goToNext(PageConfigs.accountPageConfig);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    ]));
  }
}
