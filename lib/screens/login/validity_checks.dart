import "package:awashyak_v1/widgets/toast_notifications.dart";
import "package:flutter/material.dart";
import 'dart:core';

class SignUpCheck {
  final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;
  final TextEditingController _mobileController;
  final TextEditingController _emailController;
  bool _hasError = false;
  // final mailChk=RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");
  final mailChk = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  SignUpCheck(this._passwordController, this._confirmPasswordController,
      this._mobileController, this._emailController);
  bool emptyCheck() {
    if ((_passwordController.text != "") &&
        (_mobileController.text != "") &&
        (_emailController.text != "")) {
      return true;
    } else {
      showNotification("Fields cannot be empty!");
      return false;
    }
  }

  bool multipleEmptyCheck({required List<TextEditingController> args}) {
    for (dynamic arg in args) {
      if (arg.text == "") {
        showNotification("Fields cannot be empty!");
        return false;
      }
    }
    return true;
  }

  bool passwordIdentityCheck() {
    if (_passwordController.text == _confirmPasswordController.text) {
      return true;
    } else {
      showNotification("Passwords do not match!");

      return false;
    }
  }

  bool mobileCheck() {
    try {
      _hasError = false;
      double.parse(_mobileController.text);
    } on FormatException {
      _hasError = true;
    }
    if (_hasError == false && _mobileController.text.length == 10) {
      return true;
    } else {
      showNotification("Please Enter a Valid Mobile Number");
      return false;
    }
  }

  bool emailCheck() {
    if (mailChk.hasMatch(_emailController.text)) {
      return true;
    } else {
      showNotification("Please Enter a Valid Email Address");
      return false;
    }
  }

  bool minCharacterCheck(int l, TextEditingController controller) {
    if (controller.text.length < l) {
      showNotification("Name must contain at least $l characters.");
      return false;
    } else {
      return true;
    }
  }
}

class SignInCheck {
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final mailChk = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  SignInCheck(this._emailController, this._passwordController);
  bool signInCheck() {
    if (mailChk.hasMatch(_emailController.text) != true) {
      showNotification("Please Enter a Valid Email Address");
      return false;
    } else if (_passwordController.text == "") {
      showNotification("Please enter password");
      return false;
    } else {
      return true;
    }
  }
}
