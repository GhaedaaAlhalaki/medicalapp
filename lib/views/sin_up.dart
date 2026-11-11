// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:medicalapp/const.dart';
import 'package:medicalapp/core/api/ApiUser.dart';
import 'package:medicalapp/main.dart';
import 'package:medicalapp/models/user.dart';
import 'package:medicalapp/views/controlview.dart';

class SinIn extends StatefulWidget {
  const SinIn({super.key});

  @override
  State<SinIn> createState() => _LogInState();
}

class _LogInState extends State<SinIn> {
  bool isloop = false;
  Future<UserModel>? userModel;
  ApiUser api = ApiUser();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController? nameController = TextEditingController();
  TextEditingController? phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: isloop
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                        controller: nameController,
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
                          hintText: 'Enter valid Name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: TextFormField(
                        controller: phoneController,
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
                          hintText: 'Enter valid Phone',
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
                            setState(() {
                              isloop = true;
                            });
                            String name = nameController!.text.trim();
                            String phone = phoneController!.text.trim();
                            var respon = await api.postuser(name, phone);
                            if (respon == 500) {
                              Get.snackbar(
                                "Erorr",
                                "Phone Number Is Already Exist",
                              );
                            } else if (respon == 540) {
                              Get.snackbar(
                                "Erorr",
                                "no Internet",
                              );
                            } else if (respon['status'] == 200) {
                              var uRespone = await api.getuser();
                              for (var i = 0; i < uRespone.length; i++) {
                                if (name == uRespone[i]['name'] &&
                                    phone == uRespone[i]['phone']) {
                                  shardpref.setString(
                                      "id", uRespone[i]["id"].toString());
                                  shardpref.setString(
                                      "name", uRespone[i]["name"].toString());
                                  shardpref.setString(
                                      "phone", uRespone[i]["phone"].toString());
                                  setState(() {
                                    isloop = false;
                                  });
                                  Get.snackbar(
                                    "Welcom",
                                    "To Midecal App",
                                  );
                                  await Future.delayed(
                                      const Duration(seconds: 1));
                                  Get.to(() => const Controlview());
                                }
                              }
                            } else {
                              Get.snackbar(
                                "Erorr",
                                "$respon",
                              );
                              print(respon);
                            }
                          },
                          child: const Text(
                            "Sin up",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: thirdColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
/* class CustomClipperPath extends CustomClipper<Path>() {
    @override
    Path getClip(Size size) {
      double w = size.width;
      double h = size.height;
      final path = Path();
      path.
      return path;
    }

    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) {
      return false;
    }
  }
  

  async {
                      try {
                        var respone = await api.postuser(nController, pController);
                        for (var i = 0; i < respone.length; i++) {
                          if (nController?.text == respone[i]['name'] &&
                              pController?.text == respone[i]['phone']) {
                            shardpref.setString(
                                "id", respone[i]["id"].toString());
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
  */