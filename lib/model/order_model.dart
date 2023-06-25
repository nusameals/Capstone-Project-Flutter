// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';

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
  final String paymentStatus;
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
    required this.paymentStatus,
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
      paymentStatus: json['payment_status'],
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
      'payment_status': paymentStatus,
      'order_status': orderStatus,
      'created_at': createdAt,
    };
  }
}
