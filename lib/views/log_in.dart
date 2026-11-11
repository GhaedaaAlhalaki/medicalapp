// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalapp/const.dart';
import 'package:medicalapp/core/api/ApiUser.dart';
import 'package:medicalapp/views/controlview.dart';
import 'package:medicalapp/views/sin_up.dart';

import '../main.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  ApiUser api = ApiUser();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController? nController = TextEditingController();
  TextEditingController? pController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              const Padding(
                padding: EdgeInsets.all(kDefaultPadding),
                child: Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage("images/appIcon.png"),
                    maxRadius: 75,
                    backgroundColor: secondaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: TextFormField(
                  controller: nController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    labelText: 'User Name',
                    hintText: 'Enter valid password',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: TextFormField(
                  controller: pController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    labelText: 'Phone',
                    hintText: 'Enter valid password',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      try {
                        var respone = await api.getuser();
                        for (var i = 0; i < respone.length; i++) {
                          if (nController?.text == respone[i]['name'] &&
                              pController?.text == respone[i]['phone']) {
                            shardpref.setString(
                                "id", respone[i]["id"].toString());
                            shardpref.setString(
                                "name", respone[i]["name"].toString());
                            shardpref.setString(
                                "phone", respone[i]["phone"].toString());
                            Get.to(() => const Controlview());
                          } else if (nController?.text != respone[i]['name']) {
                            print("error n");
                          } else {
                            print("error p");
                          }
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: thirdColor,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("To create an accaunt clic here : "),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const SinIn());
                    },
                    child: const Text("Sin Up"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
