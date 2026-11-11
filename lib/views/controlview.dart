import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:medicalapp/const.dart';
import 'package:medicalapp/views/cart.dart';
import 'package:medicalapp/views/fav.dart';
import 'package:medicalapp/views/home.dart';
import 'package:medicalapp/views/search.dart';
import 'package:medicalapp/widgets/drawerM.dart';

class Controlview extends StatefulWidget {
  const Controlview({super.key});

  @override
  State<Controlview> createState() => _ControlviewState();
}

class _ControlviewState extends State<Controlview> {
  int curind = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: secondaryColor,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33),
            child: Text(
              "App Name",
              style: GoogleFonts.acme(
                fontWeight: FontWeight.bold,
                fontSize: 45,
                color: thirdColor,
              ),
            ),
          ),
        ),
        drawer: const DrawerM(),
        backgroundColor: secondaryColor,
        body: myscreen[curind],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(1, -4),
                spreadRadius: 2,
                blurRadius: 6,
                color: Color.fromARGB(255, 155, 152, 152),
              ),
            ],
            color: thirdColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 20,
            ),
            child: GNav(
              backgroundColor: thirdColor,
              color: forthColor,
              activeColor: primaryColor,
              tabBackgroundColor: forthColor,
              padding: const EdgeInsets.all(16),
              gap: 8,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: "home",
                ),
                GButton(
                  icon: Icons.favorite,
                  text: "favorite",
                ),
                GButton(
                  icon: Icons.search,
                  text: "search",
                ),
                GButton(
                  icon: Icons.shopping_cart,
                  text: "Cart",
                ),
              ],
              selectedIndex: curind,
              onTabChange: (index) {
                setState(() {
                  curind = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> myscreen = [
  Home(),
  const Fav(),
  const Search(),
  const CartView(),
];
