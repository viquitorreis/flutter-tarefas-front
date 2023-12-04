import 'package:flutter/material.dart';
import 'package:front/colors/app_colors.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class Message {
  static void taskErrorOrWarning(String title, String taskErrorOrWarning) {
    Get.snackbar(
      title,
      taskErrorOrWarning,
      backgroundColor: AppColors.mainColor,
      titleText: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.redAccent,
        ),
      ),
      messageText: Text(
        taskErrorOrWarning,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
