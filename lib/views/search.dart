import 'package:flutter/material.dart';
import 'package:medicalapp/const.dart';
import 'package:medicalapp/core/api/ApiMedical.dart';
import 'package:medicalapp/models/medical.dart';
import 'package:medicalapp/widgets/medical_card.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String searched = '0';
  bool isDark = false;
  ApiMed api = ApiMed();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onFieldSubmitted: (value) async {
                  setState(() {
                    searched = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: api.getmedical(),
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
                    List<MedicalModel> searchedvalue = list
                        .where(
                          (e) =>
                              e.mname.contains(searched) ||
                              e.category.contains(searched),
                        )
                        .toList();

                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: searchedvalue.length,
                      itemBuilder: (context, index) => MedicalCard(
                        index: index,
                        medical: searchedvalue[index],
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
