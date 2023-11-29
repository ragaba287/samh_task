import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:samh_task/core/utils/app_local.dart';
import 'package:samh_task/core/utils/router.dart';

import '../../../core/utils/funs.dart';
import '../../../core/widgets/custom_snackbar.dart';
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
    return BlocConsumer<HomeCubit, HomeStates>(listener: (context, state) {
      if (state is FlightSearchSuccessState) {
        RouterNavigator.navigateTo(const ResultsScreen());
      } else if (state is FlightSearchErrorState) {
        showCustomSnackBar('Something Went wrong', context);
      } else if (state is FlightEmptySuccessState) {
        showCustomSnackBar('No Ava Flights', context, isError: false);
      }
    }, builder: (context, state) {
      HomeCubit cubit = HomeCubit.get(context);
      final GlobalKey<FormState> formKey = GlobalKey<FormState>();

      return Form(
        key: formKey,
        child: Column(
          children: [
            Container(
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
            ),
            SizedBox(height: 50.h),
            MainTextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  cubit.searchFlights();
                }
              },
              title: 'searchFlight',
              isLoading: state is FlightSearchLoadingState,
            )
          ],
        ),
      );
    });
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
                  lable: 'from',
                  toCap: true,
                  teController: cubit.teFrom,
                  validator: (value) {
                    if (value.isEmpty) return 'Enter An Airport';
                  },
                ),
              ),
              SizedBox(width: 40.w),
              Expanded(
                child: MainTextFormField(
                  lable: 'to',
                  toCap: true,
                  teController: cubit.teTo,
                  validator: (value) {
                    if (value.isEmpty) return 'Enter An Airport';
                  },
                ),
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
                    validator: (value) {},
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
