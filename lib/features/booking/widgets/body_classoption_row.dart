import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samh_task/core/utils/app_local.dart';

class TicketClassRow extends StatelessWidget {
  const TicketClassRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ClassOption(checked: false, title: 'economy'),
        SizedBox(width: 10.w),
        const ClassOption(checked: true),
        SizedBox(width: 10.w),
        const ClassOption(checked: false, title: 'firstClass'),
      ],
    );
  }
}

class ClassOption extends StatelessWidget {
  const ClassOption({
    super.key,
    this.checked = false,
    this.title = 'business',
  });

  final bool checked;
  final String title;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Expanded(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: checked ? theme.colorScheme.primary : Colors.transparent,
            border: Border.all(
              color: theme.colorScheme.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            title.tr(context).toUpperCase(),
            style: TextStyle(
              height: 0,
              fontSize: 10.sp,
              color: checked ? Colors.white : theme.colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
