import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalapp/helper/binding.dart';
import 'package:medicalapp/helper/lang/langController.dart';
import 'package:medicalapp/helper/lang/localenar.dart';
import 'package:medicalapp/views/controlview.dart';
import 'package:medicalapp/views/log_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences shardpref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  shardpref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LangController controller = Get.put(LangController());
    return GetMaterialApp(
      initialBinding: Binding(),
      translations: Translation(),
      locale: controller.initLang,
      debugShowCheckedModeBanner: false,
      home: shardpref.getString("id") == null
          ? const LogIn()
          : const Controlview(),
    );
  }
}
