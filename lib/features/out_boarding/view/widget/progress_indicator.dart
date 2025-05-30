import 'package:flutter/material.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_height.dart';
import '../../../../core/resources/manager_raduis.dart';
import '../../../../core/resources/manager_width.dart';

Container progressIndicator({
  Color color = ManagerColors.progressIndicatorColor,
  double? width,
}) {
  return Container(
    width: width ?? ManagerWidth.w12,
    height: ManagerHeight.h12,
    margin: EdgeInsetsDirectional.only(
      end: ManagerWidth.w12,
    ),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(
        ManagerRadius.r6,
      ),
    ),
  );
}
