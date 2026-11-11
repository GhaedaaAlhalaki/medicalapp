// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalapp/main.dart';

class LangController extends GetxController {
  bool isEn = false; 
  Locale initLang = shardpref.getString('lang') == null
      ? Get.deviceLocale!
      : Locale(shardpref.getString('lang')!);
  void changLang(String lang) async {
    Locale locale = Locale(lang);
    shardpref.setString('lang', lang);
    Get.updateLocale(locale);
  }
}
