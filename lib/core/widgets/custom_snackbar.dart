import 'package:flutter/material.dart';

import '../const/const.dart';

void showCustomSnackBar(
  String message,
  BuildContext context, {
  bool isError = true,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor:
          isError ? Colors.red : Theme.of(context).colorScheme.primary,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(10),
      content: Row(
        children: [
          Icon(isError ? Icons.warning_amber : Icons.info_outline),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: Colors.white,
                fontFamily: lang == 'ar' ? 'ElMessiri' : 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      duration: const Duration(seconds: 3),
    ),
  );
}
