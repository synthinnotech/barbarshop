import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

enum Purpose { success, fail, warning }

final purposeIs = {
  Purpose.success: const Color.fromARGB(255, 0, 255, 8),
  Purpose.fail: const Color.fromARGB(255, 255, 17, 0),
  Purpose.warning: const Color.fromARGB(255, 255, 230, 0),
};

final purposeIcon = {
  Purpose.success: Icons.check_box,
  Purpose.fail: Icons.error_outline,
  Purpose.warning: Icons.warning_rounded,
};

class AppController {
  static String baseUrl = 'http://barbars.com/api/';

  static Future<dynamic> getFetch(String endPoint) async {
    final url = Uri.parse('$baseUrl/$endPoint');
    final res = await http.get(url);
    if (res.statusCode == 200) {
      return res.body;
    } else {
      return {'success': false, 'message': 'Failed!'};
    }
  }

  static Future<dynamic> postFetch(String endPoint, Object object) async {
    final url = Uri.parse('$baseUrl/$endPoint');
    final res = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(object),
    );
    if (res.statusCode == 200) {
      return res.body;
    } else {
      return {'success': false, 'message': 'Failed!'};
    }
  }

  static void appToast(String title, String message,
      {Purpose purpose = Purpose.success}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.white,
      colorText: Colors.black,
      borderRadius: 5,
      duration: Duration(seconds: 3),
      icon: Icon(
        purpose == Purpose.success ? Icons.check_circle : Icons.cancel_outlined,
        color: purposeIs[purpose],
      ),
      borderColor: purposeIs[purpose],
      borderWidth: 1.0,
      mainButton: TextButton(
          onPressed: () {
            Get.closeCurrentSnackbar();
          },
          child: Icon(Icons.close)),
      margin: EdgeInsets.all(10),
      leftBarIndicatorColor: purposeIs[purpose],
    );
  }
}
