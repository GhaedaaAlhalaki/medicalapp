import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicalapp/const.dart';
import 'package:medicalapp/core/controller/OrderController.dart';
import 'package:medicalapp/core/controller/FavController.dart';
import 'package:medicalapp/models/medical.dart';

class MedicalDetalis extends StatefulWidget {
  final MedicalModel medical;

  const MedicalDetalis({super.key, required this.medical});

  @override
  State<MedicalDetalis> createState() => _MedicalDetalisState();
}

class _MedicalDetalisState extends State<MedicalDetalis> {
  @override
  Widget build(BuildContext context) {
    final OrderController oController = Get.find<OrderController>();
    final FavController fController = Get.put(FavController(), permanent: true);
    Size size = MediaQuery.of(context).size;
    bool isfav =
        fController.favList.where((e) => e.id == widget.medical.id).isEmpty
            ? false
            : true;
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        backgroundColor: thirdColor,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.only(right: kDefaultPadding),
          icon: const Icon(
            Icons.arrow_back,
            color: primaryColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          widget.medical.mname,
          style: GoogleFonts.acme(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: primaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                fController.favList
                        .where((e) => e.id == widget.medical.id)
                        .isEmpty
                    ? isfav = true
                    : isfav = false;
              });
              if (isfav == true) {
                fController.addtofav(widget.medical);
              } else {
                fController.removefav(widget.medical);
              }
            },
            icon: Icon(
              Icons.favorite,
              color: isfav ? Colors.red : primaryColor,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size.height * 0.45,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            decoration: const BoxDecoration(
              color: thirdColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Container(
                decoration: const BoxDecoration(
                  color: secondaryColor,
                  shape: BoxShape.circle,
                ),
                child: Hero(
                  tag: widget.medical.id,
                  child: Image.asset(
                    myimage[int.parse(widget.medical.image)],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Since name  :  ${widget.medical.sname}",
                  style: GoogleFonts.acme(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: thirdColor,
                  ),
                ),
                Text(
                  "Category  :  ${widget.medical.category}",
                  style: GoogleFonts.acme(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: thirdColor,
                  ),
                ),
                Text(
                  "Company name  :  ${widget.medical.company}",
                  style: GoogleFonts.acme(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: thirdColor,
                  ),
                ),
                Text(
                  "Date  :  ${widget.medical.date}",
                  style: GoogleFonts.acme(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: thirdColor,
                  ),
                ),
                Text(
                  "qunatity  :  ${widget.medical.qunatity}",
                  style: GoogleFonts.acme(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: thirdColor,
                  ),
                ),
                Text(
                  "Price  :  ${widget.medical.price}",
                  style: GoogleFonts.acme(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: thirdColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var isExist = oController.addtocart(widget.medical);
          if (isExist == true) {
            Get.snackbar("Medical", "Is Already Existing");
          }
        },
        child: const Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
