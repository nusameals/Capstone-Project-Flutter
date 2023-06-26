// ignore_for_file: public_member_api_docs, sort_constructors_first
class PaymentModel {
  int id;
  int orderId;
  int userId;
  String username;
  int totalPrice;
  String typeOrder;
  String tableNumber;
  String paymentMethods;
  int amount;
  String paymentStatus;

  PaymentModel({
    required this.id,
    required this.orderId,
    required this.userId,
    required this.username,
    required this.totalPrice,
    required this.typeOrder,
    required this.tableNumber,
    required this.paymentMethods,
    required this.amount,
    required this.paymentStatus,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: json['id'],
      orderId: json['order_id'],
      userId: json['user_id'],
      username: json['username'],
      totalPrice: json['total_price'],
      typeOrder: json['type_order'],
      tableNumber: json['table_number'],
      paymentMethods: json['payment_methods'],
      amount: json['amount'],
      paymentStatus: json['payment_status'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_id': orderId,
      'user_id': userId,
      'username': username,
      'total_price': totalPrice,
      'type_order': typeOrder,
      'table_number': tableNumber,
      'payment_methods': paymentMethods,
      'amount': amount,
      'payment_status': paymentStatus,
    };
  }
}
