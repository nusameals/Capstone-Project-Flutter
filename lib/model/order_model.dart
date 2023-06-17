// ignore_for_file: public_member_api_docs, sort_constructors_first
class MyOrder {
  String idOrder;
  String idCustomer;
  String orderStatus;
  String orderDate;
  String totalPrice;
  String type;
  String tableNumber;
  String paymentMethod;
  List<OrderDetail> orderDetail;

  MyOrder({
    required this.idOrder,
    required this.idCustomer,
    required this.orderStatus,
    required this.orderDate,
    required this.totalPrice,
    required this.type,
    required this.tableNumber,
    required this.paymentMethod,
    required this.orderDetail,
  });
  factory MyOrder.fromJson(Map<String, dynamic> json) {
    final List<dynamic> orderDetailData = json['order_detail'];
    return MyOrder(
      idOrder: json['id_order'],
      idCustomer: json['id_customer'],
      orderStatus: json['order_status'],
      orderDate: json['order_date'],
      totalPrice: json['total_price'],
      type: json['type'],
      tableNumber: json['table_number'],
      paymentMethod: json['payment_method'],
      orderDetail: orderDetailData
          .map((orderDetailJson) => OrderDetail.fromJson(orderDetailJson))
          .toList(),
    );
  }
}

class OrderDetail {
  String idOrderDetail;
  String idMenu;
  String idCategory;
  String name;
  String price;
  String calorie;
  String city;
  String qty;
  String images;

  OrderDetail({
    required this.idOrderDetail,
    required this.idMenu,
    required this.idCategory,
    required this.name,
    required this.price,
    required this.calorie,
    required this.city,
    required this.qty,
    required this.images,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      idOrderDetail: json['id_order_detail'],
      idMenu: json['id_menu'],
      idCategory: json['id_category'],
      name: json['name'],
      price: json['price'],
      calorie: json['calorie'],
      city: json['city'],
      qty: json['qty'],
      images: json['images'],
    );
  }
}
