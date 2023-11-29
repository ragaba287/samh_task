import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:samh_task/core/utils/app_local.dart';
import 'package:samh_task/core/utils/router.dart';

import '../../../core/utils/funs.dart';
import '../../../core/widgets/main_drowdown.dart';
import '../../../core/widgets/main_textbutton.dart';
import '../../../core/widgets/main_textformfield.dart';
import '../../../cubit/home/home_cubit.dart';
import '../../../cubit/home/home_states.dart';
import '../../result/screens/result_screen.dart';
import 'body_classoption_row.dart';

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
          BlocConsumer<HomeCubit, HomeStates>(
            listener: (context, state) {},
            builder: (context, state) {
              // HomeCubit cubit = HomeCubit.get(context);

              return MainTextButton(
                onPressed: () {
                  RouterNavigator.navigateTo(const ResultsScreen());
                },
                title: 'searchFlight',
              );
            },
          ),
          const Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'bestOffers'.tr(context),
              style: TextStyle(fontSize: 32.sp),
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
          const DestionationRow(),
          SizedBox(height: 30.h),

          /// ================== Date of departure =============== ///
          const DepartureDate(),
          SizedBox(height: 30.h),

          /// ================== Number of Passengers =============== ///
          const PassengersNum(),
          SizedBox(height: 30.h),

          /// ================== Ticket class =============== ///
          const TicketClassRow(),
        ],
      ),
    );
  }
}

class DestionationRow extends StatelessWidget {
  const DestionationRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);

          return Row(
            children: [
              Expanded(
                child: MainTextFormField(
                    lable: 'from', teController: cubit.teFrom),
              ),
              SizedBox(width: 40.w),
              Expanded(
                child: MainTextFormField(lable: 'to', teController: cubit.teTo),
              ),
            ],
          );
        });
  }
}

class DepartureDate extends StatelessWidget {
  const DepartureDate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);

          return Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    await showCalendarDatePicker2Dialog(
                      context: context,
                      config: CalendarDatePicker2WithActionButtonsConfig(
                        firstDate: DateTime.now(),
                      ),
                      dialogSize: const Size(325, 400),
                      value: [DateTime.now()],
                      borderRadius: BorderRadius.circular(15),
                    ).then((value) {
                      cubit.departure = value?.first ?? DateTime.now();
                      cubit.teTime.text = formatDate(cubit.departure);
                    });
                  },
                  child: MainTextFormField(
                    lable: 'departure',
                    enabled: false,
                    teController: cubit.teTime,
                  ),
                ),
              ),
              SizedBox(width: 40.w),
              const Spacer(),
            ],
          );
        });
  }
}

class PassengersNum extends StatelessWidget {
  const PassengersNum({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);

          return Row(
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
                  onChange: (val) => cubit.adults = val,
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
                  onChange: (val) => cubit.children = val,
                ),
              ),
              SizedBox(width: 40.w),
            ],
          );
        });
  }
}
