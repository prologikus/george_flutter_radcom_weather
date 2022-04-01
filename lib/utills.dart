import 'dart:core';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void simpleSnack(String message, bool error,
    [Function(GetSnackBar object)? onClick]) {
  var bg = Get.theme.colorScheme.onBackground;
  var onBg = Get.theme.colorScheme.background;

  if (error) bg = Get.theme.colorScheme.error;
  if (error) onBg = Get.theme.colorScheme.onError;

  Get.snackbar("", "",
      onTap: onClick,
      duration: const Duration(seconds: 2),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: bg,
      messageText: Text(
        message,
        textAlign: TextAlign.center,
        style:
            Get.theme.textTheme.headline4?.copyWith(fontSize: 14, color: onBg),
      ),
      snackPosition: SnackPosition.BOTTOM,
      dismissDirection: DismissDirection.horizontal,
      titleText: const SizedBox(),
      borderRadius: 30,
      maxWidth: 400,
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 15, top: 8),
      margin: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 30,
      ));
}
