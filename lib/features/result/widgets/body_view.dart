import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samh_task/core/utils/app_local.dart';

import 'flight_item.dart';

class BodyView extends StatelessWidget {
  const BodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '21 ${'avaFlights'.tr(context)}',
                style: const TextStyle(color: Colors.black38),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.filter_alt_outlined,
                  color: Colors.black38,
                ),
              ),
            ],
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => const FlightItem(),
            separatorBuilder: (context, index) => SizedBox(height: 40.h),
            itemCount: 10,
          ),
        ],
      ),
    );
  }
}
