import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:samh_task/core/utils/app_local.dart';

import '../../../core/utils/router.dart';
import '../widgets/line_plane.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, 140.h),
        child: AppBar(
          title: const Text('Search Results'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => RouterNavigator.pop(),
          ),
          bottom: PreferredSize(
            preferredSize: Size(0, 0.h),
            child: Padding(
              padding: EdgeInsets.fromLTRB(30.w, 10.h, 30.w, 20.h),
              child: Row(
                children: [
                  const DestionationColumn(
                    airPort: 'Ahmedskdls',
                    airPortChar: 'amd',
                    des: 'oneWay',
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const LinePlane(),
                        SizedBox(height: 15.h),
                        Text(
                          '23 July 2028',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const DestionationColumn(
                    airPort: 'Hypnner',
                    airPortChar: 'HBD',
                    des: 'business',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '21 Available Flight',
                  style: TextStyle(
                    color: Colors.black38,
                  ),
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
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return FlightItem();
                },
                separatorBuilder: (context, index) => SizedBox(height: 10.h),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FlightItem extends StatelessWidget {
  const FlightItem({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
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
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '2hr 15min',
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '0 STOP',
                style: TextStyle(
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
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: 22.sp,
                ),
              ),
              Expanded(child: LinePlane(color: theme.colorScheme.primary)),
              Text(
                '14:30',
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: 22.sp,
                ),
              ),
            ],
          ),
        ],
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
