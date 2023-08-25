import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom/custom_list.dart';



class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);
  @override  Widget build(BuildContext context) {
    return const AccountContent();
  }
}
class AccountContent extends StatefulWidget {
  const AccountContent({Key? key}) : super(key: key);
  @override  State<AccountContent> createState() => _AccountContentState();
}
class _AccountContentState extends State<AccountContent> {
  @override  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 90.sp,
                backgroundColor: Colors.black,
                flexibleSpace: const FlexibleSpaceBar(
                  title: Text('Help',textScaleFactor: 1,textAlign: (TextAlign.start),),
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
                        const Text('Account',style: TextStyle(fontSize: 25,),),
                        SizedBox(
                          height: 40.h,
                        ),
                        CustomList(
                          title: "Can't sign in or request a trip",
                          trailing: Icons.arrow_forward_ios_sharp,
                          onTap: (){
                          },
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        CustomList(
                          title: 'Account settings',
                          trailing: Icons.arrow_forward_ios_sharp,
                          onTap: (){},
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        CustomList(
                          title: 'Payment methods',
                          trailing: Icons.arrow_forward_ios_sharp,
                          onTap: (){},
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        CustomList(
                          title: 'Duplicate or unknown charges',
                          trailing: Icons.arrow_forward_ios_sharp,
                          onTap: (){},
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        CustomList(
                          title: 'Gift cards and vouchers',
                          trailing: Icons.arrow_forward_ios_sharp,
                          onTap: (){},
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        CustomList(
                          title: 'Promos and partnership',
                          trailing: Icons.arrow_forward_ios_sharp,
                          onTap: (){},
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        CustomList(
                          title: 'Uber Cash',
                          trailing: Icons.arrow_forward_ios_sharp,
                          onTap: (){},
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        CustomList(
                          title: 'Uber Money',
                          trailing: Icons.arrow_forward_ios_sharp,
                          onTap: (){},
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        CustomList(
                          title: 'Receipts and invoices',
                          trailing: Icons.arrow_forward_ios_sharp,
                          onTap: (){},
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        CustomList(
                          title: 'Other payment support',
                          trailing: Icons.arrow_forward_ios_sharp,
                          onTap: (){},
                        ),
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