// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:medicalapp/models/medical.dart';

class FavController extends GetxController {
  List<MedicalModel> favList = [];
  addtofav(MedicalModel medical) {
    favList.add(medical);
  }

  removefav(MedicalModel medical) {
    favList.removeWhere((e) => e.id == medical.id);
  }
}
