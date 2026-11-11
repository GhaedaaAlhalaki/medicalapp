import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalapp/const.dart';
import 'package:medicalapp/core/api/ApiMedical.dart';
import 'package:medicalapp/models/category.dart';
import 'package:medicalapp/models/medical.dart';
import 'package:medicalapp/widgets/medical_card.dart';

class CategoryDetalis extends StatelessWidget {
  final CategoryModel category;
  const CategoryDetalis({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    ApiMed apiP = ApiMed();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: thirdColor,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.only(right: kDefaultPadding),
          icon: const Icon(
            Icons.arrow_back,
            color: forthColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          category.name,
          style: const TextStyle(color: secondaryColor),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
          future: apiP.getmedical(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<MedicalModel> list = [];
              for (var i = 0; i < snapshot.data!.length; i++) {
                list.add(
                  MedicalModel(
                    sname: snapshot.data![i]["sname"],
                    mname: snapshot.data![i]["mname"],
                    category: snapshot.data![i]["category"],
                    company: snapshot.data![i]["company"],
                    date: snapshot.data![i]["date"],
                    qunatity: snapshot.data![i]["qunatity"],
                    price: snapshot.data![i]["price"],
                    id: snapshot.data![i]["id"],
                    image: snapshot.data![i]["image"],
                  ),
                );
              }

              List<MedicalModel> categoryvalue =
                  list.where((e) => e.category == category.name).toList();
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categoryvalue.length,
                itemBuilder: (context, index) => MedicalCard(
                  index: index,
                  medical: MedicalModel(
                    sname: categoryvalue[index].sname,
                    mname: categoryvalue[index].mname,
                    category: categoryvalue[index].category,
                    company: categoryvalue[index].company,
                    date: categoryvalue[index].date,
                    qunatity: categoryvalue[index].qunatity,
                    price: categoryvalue[index].price,
                    id: categoryvalue[index].id,
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
    );
  }
}
