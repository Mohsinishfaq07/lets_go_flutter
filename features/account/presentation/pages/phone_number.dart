import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom/custom_buttons.dart';

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const PhoneNumberContent();
  }
}

class PhoneNumberContent extends StatefulWidget {
  const PhoneNumberContent({Key? key}) : super(key: key);
  @override
  State<PhoneNumberContent> createState() => _PhoneNumberContentState();
}

class _PhoneNumberContentState extends State<PhoneNumberContent> {
  bool selected = false;
  String countryFlag = '';
  String phoneCode = '';
  Country? selectedCountry;
  TextEditingController numberCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: Container(
                  child: Icon(
                    Icons.arrow_back_outlined,
                    size: 30.sp,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                padding: EdgeInsets.only(top: 60.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Phone',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Container(
                            width: 105.w,
                            height: 55.h,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: selected
                                        ? Colors.black
                                        : Colors.transparent,
                                    width: 2)),
                            child: Padding(
                              padding: EdgeInsets.only(left: 15.w, right: 15.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    countryFlag.toString(),
                                    style: TextStyle(fontSize: 30.sp),
                                  ),
                                  const Icon(Icons.arrow_drop_down_sharp)
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              selected = !selected;
                            });
                            showCountryPicker(
                              context: context,
                              onSelect: (Country value) {
                                print(value.countryCode.toString());
                                print(value.phoneCode.toString());
                                print(value.flagEmoji.toString());
                                countryFlag = value.flagEmoji.toString();
                                selectedCountry = value;
                                setState(() {});
                              },
                            );
                          },
                        ),
                        Container(
                            width: 215.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r)),
                            child: TextField(
                              controller: numberCont,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3.w, color: Colors.black)),
                                  prefix: Text(
                                    "+" +
                                        (selectedCountry?.phoneCode ?? "") +
                                        " ",
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  hintText: 'Mobile number',
                                  hintStyle:
                                      const TextStyle(color: Colors.grey)),
                            ))
                      ],
                    ),
                    SizedBox(height: 40.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: CustomButtons(
                        title: 'Update',
                        titleColor: Colors.white,
                        color: Colors.black,
                        radius: BorderRadius.circular(10.r),
                        onTap: () {},
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
