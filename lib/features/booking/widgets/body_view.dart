import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:samh_task/core/utils/app_local.dart';
import 'package:samh_task/core/utils/funs.dart';
import 'package:samh_task/core/widgets/main_drowdown.dart';
import 'package:samh_task/core/widgets/main_textformfield.dart';

import '../../../core/widgets/main_textbutton.dart';

class BodyView extends StatelessWidget {
  const BodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Column(
        children: [
          const TicketForm(),
          SizedBox(height: 50.h),
          MainTextButton(
            onPressed: () {},
            title: 'Search Flight',
          ),
          const Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'bestOffers'.tr(context),
              style: TextStyle(
                fontSize: 32.sp,
              ),
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}

class TicketForm extends StatelessWidget {
  const TicketForm({super.key});

  @override
  Widget build(BuildContext context) {
    String adults = '1';
    String children = '0';
    DateTime departure = DateTime.now();
    TextEditingController teFrom = TextEditingController();
    TextEditingController teTo = TextEditingController();
    TextEditingController teTime =
        TextEditingController(text: formatDate(departure));
    ThemeData theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      decoration: BoxDecoration(
        border: const DashedBorder.fromBorderSide(
          dashLength: 4,
          side: BorderSide(color: Colors.black26, width: 2),
        ),
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      child: Column(
        children: [
          /// ================== Destionation =============== ///
          Row(
            children: [
              Expanded(
                child: MainTextFormField(lable: 'From', teController: teFrom),
              ),
              SizedBox(width: 40.w),
              Expanded(
                child: MainTextFormField(lable: 'To', teController: teTo),
              ),
            ],
          ),
          SizedBox(height: 30.h),

          /// ================== Date of departure =============== ///
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    await showCalendarDatePicker2Dialog(
                      context: context,
                      config: CalendarDatePicker2WithActionButtonsConfig(),
                      dialogSize: const Size(325, 400),
                      value: [DateTime.now()],
                      borderRadius: BorderRadius.circular(15),
                    ).then((value) {
                      departure = value?.first ?? DateTime.now();
                      teTime.text = formatDate(departure);
                    });
                  },
                  child: MainTextFormField(
                    lable: 'departure',
                    enabled: false,
                    teController: teTime,
                  ),
                ),
              ),
              SizedBox(width: 40.w),
              const Spacer(),
            ],
          ),
          SizedBox(height: 30.h),

          /// ================== Number of Passengers =============== ///
          Row(
            children: [
              Expanded(
                child: MainDropDown(
                  title: 'adults',
                  items: const [
                    '1',
                    '2',
                    '3',
                    '4',
                    '5',
                    '6',
                    '7',
                    '8',
                    '9',
                  ],
                  onChange: (val) => adults = val,
                ),
              ),
              SizedBox(width: 80.w),
              Expanded(
                child: MainDropDown(
                  title: 'children',
                  items: const [
                    '0',
                    '1',
                    '2',
                    '3',
                    '4',
                    '5',
                    '6',
                    '7',
                    '8',
                    '9'
                  ],
                  onChange: (val) => children = val,
                ),
              ),
              SizedBox(width: 40.w),
            ],
          ),
          SizedBox(height: 30.h),

          /// ================== Ticket class =============== ///
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(10.r),
                  child: Container(
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: theme.colorScheme.primary,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      'Economy'.toUpperCase(),
                      style: TextStyle(
                        height: 0,
                        fontSize: 10.sp,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(10.r),
                  child: Container(
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      border: Border.all(
                        color: theme.colorScheme.primary,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      'Business'.toUpperCase(),
                      style: TextStyle(
                          height: 0, fontSize: 10.sp, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(10.r),
                  child: Container(
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: theme.colorScheme.primary,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      'First Class'.toUpperCase(),
                      style: TextStyle(
                        height: 0,
                        fontSize: 10.sp,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
