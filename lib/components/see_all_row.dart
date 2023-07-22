import 'package:flutter/cupertino.dart';

import '../utils/app_theme.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';

Container seeAllRowWidget(String text) {
  return Container(
    margin: const EdgeInsets.only(top: 20, right: 22, left: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppTheme.getTextTheme(null)
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.w800),
        ),
        Text(
          Strings.seeAll,
          style: AppTheme.getTextTheme(null)
              .bodyMedium!
              .copyWith(color: orange, fontWeight: FontWeight.w700),
        )
      ],
    ),
  );
}
