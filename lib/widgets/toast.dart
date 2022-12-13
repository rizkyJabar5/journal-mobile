import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utilities/app_styles.dart';

void toastMessage(String message, bool isSuccess) {
  Fluttertoast.showToast(
    msg: message,
    timeInSecForIosWeb: 2,
    backgroundColor: isSuccess ? Styles.successColor : Styles.errorColor,
    textColor: Colors.white,
    fontSize: 18.0,
    gravity: ToastGravity.SNACKBAR,
  );
}
