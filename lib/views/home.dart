// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicalapp/const.dart';
import 'package:medicalapp/core/api/ApiCate.dart';
import 'package:medicalapp/core/api/ApiMedical.dart';
import 'package:medicalapp/models/category.dart';
import 'package:medicalapp/models/medical.dart';
import 'package:medicalapp/widgets/cate_widget.dart';
import 'package:medicalapp/widgets/medical_card.dart';

class Home extends StatelessWidget {
  Home({super.key});
  ApiMed apiP = ApiMed();
  ApiCate apiCate = ApiCate();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  color: primaryColor,
                ),
                child: Text(
                  "Category".tr,
                  style: GoogleFonts.acme(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: thirdColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: apiCate.getCategory(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) => CategoryWidget(
                        itemIndex: index,
                        categoryModel:
                            CategoryModel(name: snapshot.data![index]["name"]),
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text("no data"),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  color: primaryColor,
                ),
                child: Text(
                  "Medicals".tr,
                  style: GoogleFonts.acme(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: thirdColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 1.5,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: apiP.getmedical(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) => MedicalCard(
                        index: index,
                        medical: MedicalModel(
                          sname: snapshot.data![index]["sname"],
                          mname: snapshot.data![index]["mname"],
                          category: snapshot.data![index]["category"],
                          company: snapshot.data![index]["company"],
                          date: snapshot.data![index]["date"],
                          qunatity: snapshot.data![index]["qunatity"],
                          price: snapshot.data![index]["price"],
                          id: snapshot.data![index]["id"],
                          image: snapshot.data![index]["image"],
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text("no data"),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
