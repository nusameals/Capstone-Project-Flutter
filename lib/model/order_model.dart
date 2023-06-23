// ignore_for_file: public_member_api_docs, sort_constructors_first
class Order {
  final int id;
  final int userId;
  final int menuId;
  final int quantity;
  final String typeOrder;
  final int totalPrice;
  final String orderStatus;
  final DateTime createdAt;
  final DateTime updatedAt;

  Order({
    required this.id,
    required this.userId,
    required this.menuId,
    required this.quantity,
    required this.typeOrder,
    required this.totalPrice,
    required this.orderStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      userId: json['user_id'],
      menuId: json['menu_id'],
      quantity: json['quantity'],
      typeOrder: json['type_order'],
      totalPrice: json['total_price'],
      orderStatus: json['order_status'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'menu_id': menuId,
      'quantity': quantity,
      'type_order': typeOrder,
      'total_price': totalPrice,
      'order_status': orderStatus,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

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
