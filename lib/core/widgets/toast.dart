import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../exceptions/exceptions.dart';

class CustomToast {
  CustomToast.showDefault(String message) {
    BotToast.closeAllLoading();
    showToast(message);
  }

  CustomToast.showError(CustomError error) {
    BotToast.closeAllLoading();
    String message = '';
    switch (error) {
      case CustomError.noInternet:
        message = 'Please Check Your Internet';
        break;
      case CustomError.unKnown:
        message = 'Some things wrong';
        break;
      case CustomError.formatException:
        message = 'Some things wrong';
        break;
      case CustomError.notFound:
        message = 'Not Found';
        break;
      case CustomError.badRequest:
        message = 'Some things wrong';
        break;
    }

    showToast(message);
  }

  CustomToast.showLoading() {
    showLoading();
  }

  void showToast(String message) {
    BotToast.showText(
      text: message,
      textStyle: TextStyle(
        overflow: TextOverflow.visible,
        color: ConstColors.backgroundColor,
      ),
      contentColor: Colors.grey[700]!,
      crossPage: false,
      clickClose: true,
      duration: const Duration(seconds: 5),
    );
  }

  void showLoading() {
    BotToast.showLoading();
  }

  CustomToast.closeLoading() {
    closeLoading();
  }

  void closeLoading() {
    BotToast.closeAllLoading();
  }
}
