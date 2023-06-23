class PaymentModel {
  int id;
  int orderId;
  int userId;
  double amount;
  String status;
  String method;
  String paymentType;

  PaymentModel({
    required this.id,
    required this.orderId,
    required this.userId,
    required this.amount,
    required this.status,
    required this.method,
    required this.paymentType,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: json['id'],
      orderId: json['order_id'],
      userId: json['user_id'],
      amount: json['amount'].toDouble(),
      status: json['status'],
      method: json['method'],
      paymentType: json['payment_type'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_id': orderId,
      'user_id': userId,
      'amount': amount,
      'status': status,
      'method': method,
      'payment_type': paymentType,
    };
  }
}
