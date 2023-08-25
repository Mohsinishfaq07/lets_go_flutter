import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpATrip extends StatelessWidget {
  const HelpATrip({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const HelpWithATripContent();
  }
}

class HelpWithATripContent extends StatefulWidget {
  const HelpWithATripContent({Key? key}) : super(key: key);
  @override
  State<HelpWithATripContent> createState() => _HelpWithATripContentState();
}

class _HelpWithATripContentState extends State<HelpWithATripContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        expandedHeight: 90.sp,
        backgroundColor: Colors.black,
        flexibleSpace: const FlexibleSpaceBar(
          title: Text(
            'Choose a trip',
            textScaleFactor: 1,
            textAlign: (TextAlign.start),
          ),
        ),
        pinned: true,
      ),
      SliverList(
        delegate: SliverChildListDelegate([
          Container(
            height: 660.h,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("You haven't taken a trip yet."),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  width: 70.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1)),
                  child: const Center(child: Text('Retry')),
                )
              ],
            ),
          )
        ]),
      ),
    ]));
  }
}
