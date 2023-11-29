import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samh_task/core/utils/app_local.dart';

enum ButtonLook { filled, border, text, disable }

class MainTextButton extends StatelessWidget {
  const MainTextButton({
    super.key,
    required this.onPressed,
    this.title = 'title',
    this.buttonLook = ButtonLook.filled,
    this.isLoading = false,
    this.removeSize = false,
    this.color,
    this.borderColor,
    this.borderRadius,
    this.icon,
  });

  final Function onPressed;
  final String title;
  final ButtonLook buttonLook;
  final bool isLoading;
  final bool removeSize;
  final Color? color;
  final Color? borderColor;
  final double? borderRadius;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return TextButton(
      onPressed: () =>
          buttonLook == ButtonLook.disable || isLoading ? null : onPressed(),
      style: TextButton.styleFrom(
        backgroundColor: isLoading
            ? Colors.grey
            : {
                  ButtonLook.filled: color ?? theme.colorScheme.primary,
                  ButtonLook.text: Colors.transparent,
                  ButtonLook.disable: const Color(0xff818181),
                }[buttonLook] ??
                const Color(0x10188653),
        fixedSize: removeSize ? null : Size(350.w, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 50.r),
          side: BorderSide(
            color: buttonLook == ButtonLook.border
                ? borderColor ?? const Color(0xff188653)
                : Colors.transparent,
          ),
        ),
      ),
      child: isLoading
          ? const SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(color: Colors.white),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) Icon(icon),
                if (icon != null) SizedBox(width: 10.w),
                Text(
                  title.tr(context),
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: {
                          ButtonLook.filled: Colors.white,
                          ButtonLook.text: const Color(0xff188653),
                          ButtonLook.disable: Colors.white,
                          ButtonLook.border: const Color(0xff188653),
                        }[buttonLook] ??
                        const Color(0x10188653),
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                  softWrap: false,
                ),
              ],
            ),
    );
  }
}
