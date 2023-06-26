class Order {
  final int id;
  final int userId;
  final int menuId;
  final String menuName;
  final String menuImages;
  final String menuCity;
  final String menuCalories;
  final int priceMenu;
  final int quantity;
  final String typeOrder;
  final String tableNumber;
  final int totalPrice;
  final String paymentMethods;
  final String orderStatus;
  final String createdAt;

  Order({
    required this.id,
    required this.userId,
    required this.menuId,
    required this.menuName,
    required this.menuImages,
    required this.menuCity,
    required this.menuCalories,
    required this.priceMenu,
    required this.quantity,
    required this.typeOrder,
    required this.tableNumber,
    required this.totalPrice,
    required this.paymentMethods,
    required this.orderStatus,
    required this.createdAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      userId: json['user_id'],
      menuId: json['menu_id'],
      menuName: json['menu_name'],
      menuImages: json['menu_images'],
      menuCity: json['menu_city'],
      menuCalories: json['menu_calories'],
      priceMenu: json['price_menu'],
      quantity: json['quantity'],
      typeOrder: json['type_order'],
      tableNumber: json['table_number'],
      totalPrice: json['total_price'],
      orderStatus: json['order_status'],
      paymentMethods: json['payment_methods'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'menu_id': menuId,
      'menu_name': menuName,
      'menu_images': menuImages,
      'menu_city': menuCity,
      'menu_calories': menuCalories,
      'price_menu': priceMenu,
      'quantity': quantity,
      'type_order': typeOrder,
      'table_number': tableNumber,
      'total_price': totalPrice,
      'payment_methods': paymentMethods,
      'order_status': orderStatus,
      'created_at': createdAt,
    };
  }
}
