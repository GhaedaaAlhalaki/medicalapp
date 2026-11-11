// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:medicalapp/core/api/ApiOrder.dart';
import 'package:medicalapp/models/order.dart';
import 'package:medicalapp/widgets/order_widget.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  ApiOrder api = ApiOrder();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: api.getOrder(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) => OrderCard(
                        order: OrderModel(
                          id: snapshot.data![index]["id"],
                          mid: snapshot.data![index]["mid"],
                          owner: snapshot.data![index]["owner"],
                          mqunatity: snapshot.data![index]["mqunatity"],
                          mname: snapshot.data![index]["mname"],
                          oprice: snapshot.data![index]["oprice"],
                          ostate: snapshot.data![index]["ostate"],
                          pstate: snapshot.data![index]["pstate"],
                          create: snapshot.data![index]["created_at"],
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
