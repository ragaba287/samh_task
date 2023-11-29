import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samh_task/core/utils/app_local.dart';

import '../../../core/res/res_images.dart';
import '../../../cubit/home/home_cubit.dart';
import '../../../cubit/home/home_states.dart';
import 'appbar_lang_changer.dart';
import 'appbar_tripoption_row.dart';

class BookingAppBar extends StatelessWidget {
  const BookingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);

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

          ///================== Trip Option Row ============///
          bottom: PreferredSize(
            preferredSize: Size(0, 0.h),
            child: const TripOptionRow(),
          ),
        );
      },
    );
  }
}
