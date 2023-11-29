import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samh_task/core/utils/app_local.dart';
import 'package:samh_task/models/flight_model.dart';

import '../../../core/utils/router.dart';
import '../../../cubit/home/home_cubit.dart';
import '../../../cubit/home/home_states.dart';
import 'line_plane.dart';

class ResultsAppBar extends StatelessWidget {
  const ResultsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('searchResults'.tr(context)),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => RouterNavigator.pop(),
      ),
      bottom: PreferredSize(
        preferredSize: Size(0, 0.h),
        child: Padding(
          padding: EdgeInsets.fromLTRB(30.w, 10.h, 30.w, 20.h),
          child: BlocConsumer<HomeCubit, HomeStates>(
              listener: (context, state) {},
              builder: (context, state) {
                HomeCubit cubit = HomeCubit.get(context);
                FlightModel flightModel = cubit.flightList.first;

                return Row(
                  children: [
                    DestionationColumn(
                      airPort: flightModel.departure?.airportName ?? '',
                      airPortChar: flightModel.departure?.airportCode ?? '',
                      des: 'oneWay',
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const LinePlane(),
                          SizedBox(height: 15.h),
                          Text(
                            flightModel.date ?? '',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    DestionationColumn(
                      airPort: flightModel.arrival?.airportName ?? '',
                      airPortChar: flightModel.arrival?.airportCode ?? '',
                      des: 'business',
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

class DestionationColumn extends StatelessWidget {
  const DestionationColumn({
    super.key,
    required this.airPortChar,
    required this.airPort,
    required this.des,
  });

  final String airPortChar;
  final String airPort;
  final String des;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          airPortChar.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
        SizedBox(height: 3.h),
        Text(
          airPort,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 10.sp,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          des.tr(context),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 10.sp,
          ),
        ),
      ],
    );
  }
}
