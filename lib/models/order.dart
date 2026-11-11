class OrderModel {
  String owner, mname, oprice, ostate, pstate, mqunatity, create, mid;
  int id;

  OrderModel({
    required this.mid,
    required this.id,
    required this.owner,
    required this.mqunatity,
    required this.mname,
    required this.oprice,
    required this.ostate,
    required this.pstate,
    required this.create,
  });
}
