// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicalapp/const.dart';
import 'package:medicalapp/core/api/ApiOrder.dart';
import 'package:medicalapp/core/controller/OrderController.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  OrderController orderController = Get.find<OrderController>();
  ApiOrder api = ApiOrder();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: GetBuilder<OrderController>(
        init: OrderController(),
        builder: (controller) => controller.cartlist.isEmpty
            ? const Center(
                child: Text("Cart Is Empty ;)"),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        color: forthColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Price : ",
                              style: GoogleFonts.acme(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: secondaryColor,
                              ),
                            ),
                            Text(
                              "${controller.totale}",
                              style: GoogleFonts.acme(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: secondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.separated(
                        itemCount: controller.cartlist.length,
                        itemBuilder: (context, index) => Container(
                          padding: const EdgeInsets.all(kDefaultPadding / 2),
                          margin: const EdgeInsets.all(kDefaultPadding),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: forthColor,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: secondaryColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(controller.cartlist[index].medicalsname),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        controller.increartQ(index);
                                      },
                                      icon: const Icon(Icons.add),
                                    ),
                                    Text(controller.cartlist[index].quantity
                                        .toString()),
                                    IconButton(
                                      onPressed: () {
                                        controller.decreartQ(index);
                                      },
                                      icon: const Icon(Icons.remove),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 16);
                        },
                      ),
                    )
                  ],
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.dialog(
            Dialog(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("are you shoure you want pay this ? "),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () async {
                        try {
                          var respon =
                              await api.postOrder(orderController.sendorder());
                          print(respon);

                          /*if (respon['status'] == 200) {
                            Get.back();
                            orderController.clearCart();
                            await Future.delayed(const Duration(seconds: 1));
                            Get.snackbar(
                              "Order",
                              "Subment Successfuly",
                              icon: const Icon(
                                Icons.done,
                                color: Colors.green,
                              ),
                            );
                          } else {
                            Get.snackbar(
                              "Order",
                              "Subment unsuccessfuly",
                              icon: const Icon(
                                Icons.error,
                                color: Colors.red,
                              ),
                            );
                          }*/
                        } catch (e) {
                          return print(e);
                        }
                      },
                      child: const Text(
                        "Subment",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: thirdColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: const Icon(Icons.done_all),
      ),
    );
  }
}
