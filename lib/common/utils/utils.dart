import 'package:chat_application/main.dart';
import 'package:flutter/material.dart';

class Utils {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static void showCircularProgressIndicator(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  static void showSnackBar(String? message) {
    if (message == null) return;

    final snackBar = SnackBar(content: Text(message));
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }


}
