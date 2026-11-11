import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicalapp/const.dart';
import 'package:medicalapp/models/category.dart';
import 'package:medicalapp/views/category_detalis.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.itemIndex,
    required this.categoryModel,
  });
  final int itemIndex;
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => CategoryDetalis(category: categoryModel));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: primaryColor,
        ),
        child: Center(
          child: Text(
            categoryModel.name.tr,
            style: GoogleFonts.acme(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: thirdColor,
            ),
          ),
        ),
      ),
    );
  }
}
