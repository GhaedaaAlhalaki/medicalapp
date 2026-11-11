import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalapp/const.dart';
import 'package:medicalapp/core/controller/FavController.dart';
import 'package:medicalapp/widgets/medical_card.dart';

class Fav extends StatelessWidget {
  const Fav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width,
              child: GetBuilder<FavController>(
                init: FavController(),
                builder: (controller) => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.favList.length,
                  itemBuilder: (context, index) => MedicalCard(
                    index: index,
                    medical: controller.favList[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
