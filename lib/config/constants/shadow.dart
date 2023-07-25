import 'package:flutter/cupertino.dart';

import 'color_theme.dart';

BoxShadow shadow() {
  return BoxShadow(
      color: AppColor.dark.withOpacity(0.2),
      offset: const Offset(1, 2),
      blurRadius: 2,
      spreadRadius: 0.5);
}