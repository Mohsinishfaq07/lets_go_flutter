import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom/custom_button_login_screen.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const WalletScreenContent();
  }
}

class WalletScreenContent extends StatefulWidget {
  const WalletScreenContent({Key? key}) : super(key: key);
  @override
  State<WalletScreenContent> createState() => _WalletScreenContentState();
}

class _WalletScreenContentState extends State<WalletScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        expandedHeight: 110.0,
        backgroundColor: Colors.white,
        flexibleSpace: const FlexibleSpaceBar(
          title: Text(
            'Wallet',
            textScaleFactor: 1,
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
        // snap: true,                pinned: true,
      ),
      SliverList(
          delegate: SliverChildListDelegate([
        Padding(
          padding:
              EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h, bottom: 35.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  gradient: LinearGradient(
                      colors: [Colors.grey, Colors.grey.shade100],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft),
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 2,
                      // blur radius
                      offset: const Offset(0.0, 1.1),
                    ),
                    //changes position of shadow
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Uber Cash'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'PKR  0 . 00',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 35.sp),
                        ),
                        const Icon(Icons.arrow_forward_ios_sharp)
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.info),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Auto-refill is off',
                          style: TextStyle(fontSize: 15.sp),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    SizedBox(
                      width: 125,
                      height: 40,
                      child: CustomButtonLoginScreen(
                          title: 'Add Funds',
                          titleColor: Colors.white,
                          color: Colors.black,
                          icon: Icons.add,
                          radius: BorderRadius.circular(40.r),
                          onTap: () {}),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 20.h, left: 20.w, right: 5.w, bottom: 25.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 1.5, //spread radius
                      offset: const Offset(0.0, 1.1), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Send a gift',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'You can now send an instant Uber\nMoney gift, for use on Uber or Uber\nEats',
                          style: TextStyle(color: Colors.black54),
                        ),
                        Icon(Icons.card_membership)
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    SizedBox(
                      width: 110.w,
                      height: 50.h,
                      child: CustomButtonLoginScreen(
                          title: 'Send a gift',
                          //image: '',                                titleColor: Colors.black,
                          color: Colors.grey.shade100,
                          radius: BorderRadius.circular(40.r),
                          onTap: () {}),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 45.h,
              ),
              Text(
                'Payment methods',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
              ),
              SizedBox(
                height: 35.h,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.card_membership,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  const Text('Cash')
                ],
              ),
              SizedBox(
                height: 35.h,
              ),
              SizedBox(
                width: 200,
                child: CustomButtonLoginScreen(
                    title: 'Add payment method',
                    //image: '',                          titleColor: Colors.black,
                    color: Colors.grey.shade100,
                    radius: BorderRadius.circular(40),
                    onTap: () {}),
              ),
              SizedBox(
                height: 35.h,
              ),
              Text(
                'Ride Profiles',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  Container(
                    height: 40.h,
                    width: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30.sp,
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  const Text('Personal')
                ],
              ),
              SizedBox(
                height: 35.h,
              ),
              Row(
                children: [
                  Container(
                    height: 40.h,
                    width: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey),
                    child: Icon(
                      Icons.cases_outlined,
                      color: Colors.white,
                      size: 30.sp,
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Start using Uber for business',
                        style: TextStyle(color: Colors.blue),
                      ),
                      Text(
                        'Turns on business travel features',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
               Text(
                'Vouchers',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 35.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.card_membership),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Vouchers',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    '0',
                    style: TextStyle(color: Colors.black54),
                  )
                ],
              ),
              SizedBox(
                height: 35.h,
              ),
              Row(
                children: [
                  const Icon(Icons.add),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'Add voucher code',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50,bottom: 25),
                child: Text(
                  'Promotions',
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.add),
                  SizedBox(
                    width: 17.w,
                  ),
                  Text(
                    'Add Promo Code',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                ],
              )
            ],
          ),
        ),
      ])),
    ]));
  }
}
