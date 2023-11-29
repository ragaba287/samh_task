import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samh_task/core/utils/app_local.dart';

import '../../../core/res/res_images.dart';
import '../../../cubit/home/home_cubit.dart';
import '../../../cubit/home/home_states.dart';
import 'lang_changer.dart';

class BookingAppBar extends StatelessWidget {
  const BookingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        ThemeData theme = Theme.of(context);

        return AppBar(
          title: Text('bookYourFlight'.tr(context)),
          leading: LangChangerButton(
            onChange: (lang) => cubit.changeLang(context, lang),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.only(end: 20.w),
              child: Image.asset(ResImages.logoW, width: 50),
            )
          ],
          bottom: PreferredSize(
            preferredSize: Size(0, 0.h),
            child: Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              //TODO TO BE FIXED
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(30.r),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Text(
                        'oneWay'.tr(context),
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w800,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(30.r),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Text(
                        'roundTrip'.tr(context),
                        style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.w800,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(30.r),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Text(
                        'multiCity'.tr(context),
                        style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.w800,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
