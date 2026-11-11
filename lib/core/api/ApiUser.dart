// ignore_for_file: file_names, avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medicalapp/const.dart';

class ApiUser {
  getuser() async {
    try {
      var response = await http.get(Uri.parse(linkuser));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return response.statusCode;
      }
    } catch (e) {
      return e;
    }
  }

  postuser(String name, String phone) async {
    try {
      var response = await http.post(
        Uri.parse(linkuserpost),
        body: {
          'name': name,
          "phone": phone,
        },
      );
      if (response.statusCode == 200) {
        var responbody = jsonDecode(response.body);
        return responbody;
      } else {
        return response.statusCode;
      }
    } catch (e) {
      return e;
    }
  }
}
