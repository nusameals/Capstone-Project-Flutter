// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartModel {
  String idCart;
  String idCustomer;
  String idMenu;
  String name;
  String city;
  String calorie;
  String images;
  String price;
  String qty;
  String cart;
  String numberTable;
  CartModel({
    required this.idCart,
    required this.idCustomer,
    required this.idMenu,
    required this.name,
    required this.city,
    required this.calorie,
    required this.images,
    required this.price,
    required this.qty,
    required this.cart,
    required this.numberTable,
  });

  factory CartModel.fromJson(json) {
    return CartModel(
      idCart: json['id_cart'],
      idCustomer: json['id_customer'],
      idMenu: json['id_menu'],
      name: json['name'],
      city: json['city'],
      calorie: json['calorie'],
      images: json['images'],
      price: json['price'],
      qty: json['qty'],
      cart: json['cart'],
      numberTable: json['number_table'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id_cart': idCart,
      'id_customer': idCustomer,
      'id_menu': idMenu,
      'name': name,
      'city': city,
      'calorie': calorie,
      'images': images,
      'price': price,
      'qty': qty,
      'cart': cart,
      'number_table': numberTable,
    };
  }
}
