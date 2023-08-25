import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sb_myreports/features/lets_go_driver/presentation/pages/pay.dart';
import 'package:sb_myreports/features/lets_go_driver/presentation/pages/rating.dart';
import 'package:sb_myreports/features/lets_go_driver/presentation/pages/ride_request.dart';

import 'my_income.dart';

class EarnByDriving extends StatelessWidget {
  const EarnByDriving({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class EarnByDrivingContent extends StatefulWidget {
  const EarnByDrivingContent({Key? key}) : super(key: key);
  @override
  State<EarnByDrivingContent> createState() => _EarnByDrivingContentState();
}

class _EarnByDrivingContentState extends State<EarnByDrivingContent> {
  int _currentIndex = 0;
  List _screens = [
    RideRequestContent(),
    MyIncomeContent(),
    RatingContent(),
    PayContent()
  ];
  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _updateIndex,
        selectedItemColor: Colors.blue[700],
        //selectedItemColor: Colors.lightGreen,        selectedFontSize: 10,
        unselectedFontSize: 10,
        iconSize: 20,
        items: const [
          BottomNavigationBarItem(
            label: "Ride requests",
            icon: Icon(Icons.list_rounded),
          ),
          BottomNavigationBarItem(
            label: "My income",
            icon: Icon(Icons.message),
          ),
          BottomNavigationBarItem(
            label: "Rating",
            icon: Icon(Icons.star_border),
          ),
          BottomNavigationBarItem(
            label: "Pay",
            icon: Icon(Icons.payment),
          ),
        ],
      ),
    );
  }
}
