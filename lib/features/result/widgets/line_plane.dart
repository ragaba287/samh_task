import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samh_task/core/const/const.dart';

class LinePlane extends StatelessWidget {
  const LinePlane({Key? key, this.color = Colors.white}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Stack(
            children: [
              SizedBox(
                height: 40.h,
                child: Flex(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  direction: Axis.horizontal,
                  children: List.generate(
                    (constraints.constrainWidth() / (2 * 6)).floor(),
                    (_) {
                      return SizedBox(
                        width: 5,
                        height: 2,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: color,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Center(
                child: RotationTransition(
                  turns:
                      AlwaysStoppedAnimation((lang == 'ar' ? -90 : 90) / 360),
                  child: Icon(
                    Icons.airplanemode_active,
                    size: 40.w,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
