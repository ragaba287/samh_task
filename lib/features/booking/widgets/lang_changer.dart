import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/res/res_icons.dart';

class LangChangerButton extends StatelessWidget {
  const LangChangerButton({super.key, required this.onChange});

  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: DropdownButton(
        isExpanded: true,
        underline: const SizedBox(),
        borderRadius: BorderRadius.circular(10),
        icon: const Icon(Icons.format_list_bulleted, color: Colors.white),
        items: ['ar', 'en'].map(
          (String value) {
            return DropdownMenuItem(
              value: value,
              child: SvgPicture.asset(
                value == 'ar' ? ResIcons.saudiaFlag : ResIcons.usaFlag,
              ),
            );
          },
        ).toList(),
        onChanged: (String? v) => onChange(v),
      ),
    );
  }
}
