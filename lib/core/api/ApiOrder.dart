// ignore_for_file: file_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medicalapp/const.dart';
import 'package:medicalapp/models/order.dart';

class ApiOrder {
  Future<List> getOrder() async {
    try {
      var response = await http.get(Uri.parse(linkorder));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error(response.statusCode);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  postOrder(OrderModel orderModel) async {
    try {
      var response = await http.post(
        Uri.parse(linkorderpost),
        body: {
          'owner': orderModel.owner,
          'mname': orderModel.mname,
          'mid': orderModel.mid,
          'oprice': orderModel.oprice,
          'ostate': orderModel.ostate,
          'pstate': orderModel.pstate,
          'mqunatity': orderModel.mqunatity,
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
