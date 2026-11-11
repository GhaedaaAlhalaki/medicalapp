import 'package:get/get.dart';

class Translation implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": en,
        "ar": ar,
      };
}

const Map<String, String> ar = {
  'Category': 'الفئات',
  "Medicals": "الأدوية",
  "Antibioti": "مضاض حيوي",
};

const Map<String, String> en = {
  'Category': 'Category',
  "Medicals": "Medicals",
  "Antibioti": "Antibioti",
};
