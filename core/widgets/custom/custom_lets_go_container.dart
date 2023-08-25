import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomiseContainer extends StatefulWidget {
  CustomiseContainer({
    required this.title,
    this.subtitle,
    this.icon,
    this.isSelected = false,

    this.icon2,
    this.switchControl,
    this.onSwitchChange,
    Key? key,
  }) : super(key: key);
  final String title;
  final String? subtitle;
  final IconData? icon;
  final IconData? icon2;
  bool? switchControl;
  final bool isSelected;
  Function(bool)? onSwitchChange;

  @override
  State<CustomiseContainer> createState() => _CustomiseContainerState();
}

class _CustomiseContainerState extends State<CustomiseContainer> {
  var textHolder = 'Switch is OFF';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      child: Icon(
                        widget.icon!,
                        size: 16.sp,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        color: Colors.black12,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      widget.subtitle!,
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                if (widget.switchControl != null)
                  Transform.scale(
                      scale: 1.2,
                      child: Switch(
                        onChanged: widget.onSwitchChange,
                        value: widget.switchControl!,
                        activeColor: Colors.blue,
                        activeTrackColor: Colors.green,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                      )),
                Icon(
                  widget.icon2,
                  size: 32.sp,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
