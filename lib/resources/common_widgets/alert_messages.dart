import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../color_manager.dart';

void showSnackBar({required BuildContext context, required String msg}) {
  showTopSnackBar(
    Overlay.of(context)!,
    CustomSnackBar.info(
      message: msg,
      backgroundColor: ColorManager.primary,
      messagePadding: const EdgeInsets.all(5),
      icon: const Icon(
        Icons.info,
        color: Color(0x15000000),
        size: 120,
      ),
    ),
  );
}