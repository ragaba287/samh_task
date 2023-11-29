import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:samh_task/core/utils/app_local.dart';

import 'line_plane.dart';

class FlightItem extends StatelessWidget {
  const FlightItem({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          decoration: BoxDecoration(
            border: const DashedBorder.fromBorderSide(
              dashLength: 4,
              side: BorderSide(color: Colors.black26, width: 2),
            ),
            borderRadius: BorderRadius.all(Radius.circular(25.r)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'IN 899',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '2hr 15min',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '0 ${'stop'.tr(context)}',
                    style: const TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text(
                    '12:15',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 22.sp,
                    ),
                  ),
                  Expanded(child: LinePlane(color: theme.colorScheme.primary)),
                  Text(
                    '14:30',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 22.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
        Positioned(
          bottom: -25.h,
          left: 30,
          right: 30,
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 50.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'bookFlight'.tr(context),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 3.w),
                  const Text(
                    '\$58',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
