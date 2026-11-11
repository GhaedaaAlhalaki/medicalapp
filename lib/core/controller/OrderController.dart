// ignore_for_file: file_names, recursive_getters, prefer_final_fields

import 'package:get/get.dart';
import 'package:medicalapp/main.dart';
import 'package:medicalapp/models/cartmodel.dart';
import 'package:medicalapp/models/medical.dart';
import 'package:medicalapp/models/order.dart';

class OrderController extends GetxController {
  List<CartModel> cartlist = [];

  int totale = 0;

  addtocart(MedicalModel medical) {
    bool isExist = false;
    for (var i = 0; i < cartlist.length; i++) {
      if (medical.mname == cartlist[i].medicalsname) {
        isExist = true;
        return true;
      }
    }

    if (isExist == false) {
      cartlist.add(
        CartModel(
          mid: medical.id,
          price: int.parse(medical.price),
          medicalsname: medical.mname,
          quantity: 1,
        ),
      );
    }
    totaleprice();
    update();
  }

  removefromcart(String name) {
    cartlist.removeWhere((e) => e.medicalsname == name);
    update();
  }

  totaleprice() {
    int sum = 0;
    for (var i = 0; i < cartlist.length; i++) {
      sum += cartlist[i].price * cartlist[i].quantity;
    }
    totale = sum;
    return totale;
  }

  increartQ(int index) {
    cartlist[index].quantity++;
    totaleprice();
    update();
  }

  decreartQ(int index) {
    if (cartlist[index].quantity != 1) {
      cartlist[index].quantity--;
      totaleprice();
      update();
    } else {
      removefromcart(cartlist[index].medicalsname);
    }
  }

  clearCart() {
    cartlist.clear();
    update();
  }

  getquantity() {
    List<int> list = [];
    for (var i = 0; i < cartlist.length; i++) {
      list.add(cartlist[i].quantity);
    }
    return list;
  }

  getname() {
    List<String> list = [];
    for (var i = 0; i < cartlist.length; i++) {
      list.add(cartlist[i].medicalsname);
    }
    return list;
  }

  getid() {
    List<String> list = [];
    for (var i = 0; i < cartlist.length; i++) {
      list.add(cartlist[i].mid.toString());
    }
    return list;
  }

  sendorder() {
    OrderModel orderModel = OrderModel(
      id: 1,
      owner: shardpref.getString('name').toString(),
      mqunatity: getquantity().toString(),
      mname: getname().toString(),
      mid: getid().toString(),
      oprice: totaleprice().toString(),
      ostate: "Binding",
      pstate: "Binding",
      create: '',
    );
    return orderModel;
  }
}
