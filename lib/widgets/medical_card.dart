import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicalapp/const.dart';
import 'package:medicalapp/models/medical.dart';
import 'package:medicalapp/views/medical_details.dart';

class MedicalCard extends StatelessWidget {
  const MedicalCard({super.key, required this.index, required this.medical});
  final int index;
  final MedicalModel medical;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: kDefaultPadding / 2,
        horizontal: kDefaultPadding,
      ),
      height: 190,
      child: GestureDetector(
        onTap: () {
          Get.to(() => MedicalDetalis(medical: medical));
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 166,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 15),
                    blurRadius: 25,
                    color: Colors.black26,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                ),
                height: 160,
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Hero(
                    tag: medical.id,
                    child: Image.asset(
                      myimage[int.parse(medical.image)],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
                width: size.width - 200,
                height: 136,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding,
                      ),
                      child: Text(
                        medical.mname.tr,
                        style: GoogleFonts.acme(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: thirdColor,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Text(
                        medical.sname.tr,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding * 1.5,
                          vertical: kDefaultPadding / 5,
                        ),
                        decoration: BoxDecoration(
                          color: kSecondarycolor,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Text(medical.price.tr),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
