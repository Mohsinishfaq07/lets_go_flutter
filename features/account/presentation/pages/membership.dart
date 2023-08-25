import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MembershipAndLoyalty extends StatelessWidget {
  const MembershipAndLoyalty({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MembershipAndLoyaltyContent();
  }
}

class MembershipAndLoyaltyContent extends StatefulWidget {
  const MembershipAndLoyaltyContent({Key? key}) : super(key: key);
  @override
  State<MembershipAndLoyaltyContent> createState() =>
      _MembershipAndLoyaltyContentState();
}

class _MembershipAndLoyaltyContentState
    extends State<MembershipAndLoyaltyContent> {
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
                      'All Topics',
                      style: TextStyle(fontSize: 25.sp),
                    ),
                    SizedBox(height: 20.h),
                    const Text('Uber Rewards is leaving')
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
