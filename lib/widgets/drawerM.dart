// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicalapp/const.dart';
import 'package:medicalapp/helper/lang/langController.dart';
import 'package:medicalapp/main.dart';
import 'package:medicalapp/views/OrderHistory.dart';
import 'package:medicalapp/views/log_in.dart';

class DrawerM extends StatefulWidget {
  const DrawerM({super.key});

  @override
  State<DrawerM> createState() => _DrawerMState();
}

class _DrawerMState extends State<DrawerM> {
  LangController controller = Get.find();
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: thirdColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Padding(
            padding: EdgeInsets.all(kDefaultPadding),
            child: CircleAvatar(
              minRadius: 80,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Name : ",
                  style: GoogleFonts.acme(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: secondaryColor,
                  ),
                ),
                Text(
                  "${shardpref.get("name")}",
                  style: GoogleFonts.acme(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Phone : ",
                  style: GoogleFonts.acme(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: secondaryColor,
                  ),
                ),
                Text(
                  "${shardpref.get("phone")}",
                  style: GoogleFonts.acme(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            onTap: () {
              Get.to(() => const OrderHistory());
            },
            leading: const Text("Order History"),
            trailing: const Icon(Icons.history),
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
          ),
          SwitchListTile(
            value: controller.isEn,
            onChanged: (value) {
              setState(() {
                controller.isEn = value;
                if (controller.isEn == true) {
                  controller.changLang('ar');
                } else {
                  controller.changLang('en');
                }
              });
            },
            title: Text(
              "Local",
              style: GoogleFonts.acme(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: secondaryColor,
              ),
            ),
          ),
          SwitchListTile(
            value: isDark,
            onChanged: (value) {
              setState(() {
                isDark = value;
              });
            },
            title: Text(
              "Theme",
              style: GoogleFonts.acme(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: secondaryColor,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                shardpref.clear();
                Get.offAll(() => const LogIn());
              },
              icon: const Icon(
                Icons.logout,
                color: secondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
