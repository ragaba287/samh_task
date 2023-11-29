import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samh_task/core/utils/app_local.dart';

class MainTextFormField extends StatelessWidget {
  const MainTextFormField({
    this.lable = 'Email',
    this.teController,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.enabled = true,
    this.integer = false,
    this.toCap = false,
    Key? key,
  }) : super(key: key);

  final String lable;
  final TextEditingController? teController;
  final TextInputAction? textInputAction;
  final Function(String value)? validator;
  final TextInputType keyboardType;
  final bool enabled;
  final bool integer;
  final bool toCap;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lable.tr(context).toUpperCase(),
          style: TextStyle(
            color: Colors.black26,
            fontSize: 12.sp,
          ),
        ),
        TextFormField(
          enabled: enabled,
          maxLines: 1,
          validator: (value) => validator!(value!),
          keyboardType: keyboardType,
          textCapitalization: TextCapitalization.characters,

          inputFormatters: <TextInputFormatter>[
            if (keyboardType == TextInputType.number && integer)
              FilteringTextInputFormatter.digitsOnly
          ],
          controller: teController,
          textInputAction: textInputAction,
          style: TextStyle(
            fontSize: 14.sp,
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.w700,
          ),

          decoration: InputDecoration(
            prefixIconConstraints: BoxConstraints(minWidth: 50.w),
            hintText: lable.tr(context).toUpperCase(),
            hintStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(3.r),
              borderSide:
                  BorderSide(width: 2, color: theme.colorScheme.primary),
            ),
            disabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(3.r),
              borderSide: const BorderSide(width: 3, color: Colors.black26),
            ),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(3.r),
              borderSide: const BorderSide(width: 3, color: Colors.black26),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(3.r),
              borderSide: const BorderSide(width: 3, color: Colors.black26),
            ),
            errorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(3.r),
              borderSide: const BorderSide(width: 3, color: Colors.red),
            ),
            errorStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xffDB3546),
            ),
          ),
          // decoration: ,
        ),
      ],
    );
  }
}
