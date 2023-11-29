import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samh_task/core/utils/app_local.dart';

class TripOptionRow extends StatelessWidget {
  const TripOptionRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TripOptionItem(checked: true),
          TripOptionItem(title: 'roundTrip'),
          TripOptionItem(title: 'multiCity'),
        ],
      ),
    );
  }
}

class TripOptionItem extends StatelessWidget {
  const TripOptionItem(
      {super.key, this.checked = false, this.title = 'oneWay'});

  final bool checked;
  final String title;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(30.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: checked ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Text(
          title.tr(context),
          style: TextStyle(
            color: checked ? theme.colorScheme.primary : Colors.white60,
            fontWeight: FontWeight.w800,
            fontSize: 10.sp,
          ),
        ),
      ),
    );
  }
}
