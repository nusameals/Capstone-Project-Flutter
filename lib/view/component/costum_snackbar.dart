import 'package:flutter/material.dart';
import '../../themes/constant.dart';

class CustomSnackbar {
  static void showSnackbar(BuildContext context, String contentText,
      {String actionText = 'Close', VoidCallback? onPressed}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: ColorTheme.primaryBlue20,
        behavior: SnackBarBehavior.floating,
        content: Text(
          contentText,
          style: ThemeText.bodyR14,
        ),
        action: SnackBarAction(
          label: actionText,
          textColor: ColorTheme.dark1,
          onPressed: onPressed ?? () {},
        ),
      ),
    );
  }
}
