// ignore_for_file: cascade_invocations

import 'package:ceiba_ui/ceiba_ui.dart';
import 'package:flutter/material.dart';
import 'package:test_ceiba/app/routes/router_config.dart';
// import 'package:swiss_ui/swiss_ui.dart';

/// {@template router_snack_bar}
/// The `RouterSnackBar` class is a Util to present Snack Bars.
/// {@endtemplate}
class RouterSnackBar {
  /// Method to press a info snack bar.
  static void info({required String message, bool isMobile = false}) {
    final textWidth = TextPainter(
      text: TextSpan(text: message),
      textDirection: TextDirection.ltr,
    );

    textWidth.layout();

    final snackBar = SnackBar(
      margin: isMobile
          ? const EdgeInsets.only(
              left: AppSpacing.lg,
              right: AppSpacing.lg,
              bottom: AppSpacing.lg,
            )
          : null,
      width: isMobile ? null : textWidth.width * 1.5,
      content: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: isMobile ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: UITextStyle.paragraphs.paragraph2Medium.copyWith(
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: AppColors.neutral02,
    );
    rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  /// Method to press a error snack bar.
  static void error({required String error, bool isMobile = false}) {
    final snackBar = SnackBar(
      margin: isMobile
          ? const EdgeInsets.only(
              left: AppSpacing.lg,
              right: AppSpacing.lg,
              bottom: AppSpacing.lg,
            )
          : null,
      width: isMobile ? null : 350,
      content: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            error,
            textAlign: TextAlign.center,
            style: UITextStyle.paragraphs.paragraph2Medium.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: AppColors.error,
    );
    rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  /// Method to press a primaryLight style snack bar.
  static void primaryLight({
    required String message,
    bool isMobile = false,
    TextStyle? textStyle,
    MainAxisAlignment? aligment,
  }) {
    final snackBar = SnackBar(
      margin: isMobile
          ? const EdgeInsets.only(
              left: AppSpacing.lg,
              right: AppSpacing.lg,
              bottom: AppSpacing.lg,
            )
          : null,
      width: (isMobile ? null : 350),
      content: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: aligment ?? MainAxisAlignment.start,
        children: [
          Text(
            message,
            textAlign: TextAlign.start,
            style: textStyle ??
                UITextStyle.captions.captionMedium.copyWith(
                  color: AppColors.error,
                ),
          ),
        ],
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: AppColors.primaryLight,
    );
    rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  /// Method to press a success style snack bar.
  static void success({
    required String message,
    bool isMobile = false,
    TextStyle? textStyle,
    MainAxisAlignment? aligment,
  }) {
    final snackBar = SnackBar(
      margin: isMobile
          ? const EdgeInsets.only(
              left: AppSpacing.lg,
              right: AppSpacing.lg,
              bottom: AppSpacing.lg,
            )
          : null,
      width: (isMobile ? null : 350),
      content: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: aligment ?? MainAxisAlignment.start,
        children: [
          Text(
            message,
            textAlign: TextAlign.start,
            style: textStyle ??
                UITextStyle.captions.captionMedium.copyWith(
                  color: AppColors.success07,
                ),
          ),
        ],
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: AppColors.success01,
    );
    rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  /// Method to press a neutral style snack bar.
  static void neutral({
    required String message,
    bool isMobile = false,
    TextStyle? textStyle,
    MainAxisAlignment? aligment,
  }) {
    final snackBar = SnackBar(
      margin: isMobile
          ? const EdgeInsets.only(
              left: AppSpacing.lg,
              right: AppSpacing.lg,
              bottom: AppSpacing.lg,
            )
          : null,
      width: (isMobile ? null : 350),
      content: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: aligment ?? MainAxisAlignment.start,
        children: [
          Text(
            message,
            textAlign: TextAlign.start,
            style: textStyle ??
                UITextStyle.captions.captionMedium.copyWith(
                  color: AppColors.black,
                ),
          ),
        ],
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: AppColors.neutral02,
    );
    rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }
}
