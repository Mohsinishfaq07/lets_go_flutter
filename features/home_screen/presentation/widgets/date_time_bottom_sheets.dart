import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../core/router/app_state.dart';
import '../../../../core/router/models/page_config.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../../core/widgets/custom/customise_button.dart';

class DateTimeBottomSheet {
  DateTimeBottomSheet();
  void show() {
    showModalBottomSheet(
      context: navigatorKeyGlobal.currentContext!,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => const DateTimeBottomSheetContent(),
    );
  }
}


class DateTimeBottomSheetContent extends StatefulWidget {
  const DateTimeBottomSheetContent({
    Key? key,
  }) : super(key: key);

  @override
  State<DateTimeBottomSheetContent> createState() => _DateTimeBottomSheetContentState();
}

class _DateTimeBottomSheetContentState extends State<DateTimeBottomSheetContent> {
  final TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 26.h),
            child: Text(
              "Schedule a trip ",
              style: TextStyle(fontSize: 22.sp),
            ),
          ),
          const Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          InkWell(
            onTap: () async{
              DateTime? pickeddate =await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2023),
                  lastDate: DateTime(2023));
              if (pickeddate != null ){
                setState(() {
                  _date.text = DateFormat("yyyy-MM-dd").format(pickeddate);
                });
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 22.h),
              child:Text(DateTime.now().toString()),
            ),
          ),
          const Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 22.h),
            child: InkWell(
              onTap: () async {
                await showTimePicker(
                    context: context, initialTime: TimeOfDay.now());
              },
              child: Text(
                "9:55 am - 10:05 am ",
                style: TextStyle(fontSize: 22.sp),
              ),
            ),
          ),
          const Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: CustomButton(
              title: 'Set pick-up time',
              textcolor: Colors.white,
              bgColor: Colors.black,
              ontap: () {
                AppState appState = sl();
                appState.goToNext(PageConfigs.planYourTripPageConfig);
              },
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
