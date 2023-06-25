// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/order_model.dart';
import '../../themes/constant.dart';

class OrderDetailScreen extends StatelessWidget {
  final Order orderModel;
  const OrderDetailScreen(this.orderModel);

  @override
  Widget build(BuildContext context) {
    final priceFormat =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 20),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Order Detail',
          style: ThemeText.subHeadingR20,
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Image.network(
                        orderModel.menuImages,
                        width: 100,
                        height: 100,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  orderModel.menuName,
                                  overflow: TextOverflow.ellipsis,
                                  style: ThemeText.subHeadingB18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    orderModel.menuCity,
                                    style: ThemeText.bodyR14Dark4,
                                  ),
                                  Text(
                                    '${orderModel.menuCalories} kkal',
                                    style: ThemeText.bodyB14Dark4,
                                  ),
                                ],
                              ),
                              Text(
                                priceFormat.format(
                                  orderModel.totalPrice,
                                ),
                                style: ThemeText.bodyB20,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  thickness: 1,
                  color: ColorTheme.primaryBlue60,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order Details',
                  textAlign: TextAlign.start,
                  style: ThemeText.bodyB18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order Number',
                      style: ThemeText.bodyR14,
                    ),
                    Text(
                      orderModel.id.toString(),
                      style: ThemeText.bodyT14,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Type',
                      style: ThemeText.bodyR14,
                    ),
                    Text(
                      orderModel.typeOrder,
                      style: ThemeText.bodyT14,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Table Number',
                      style: ThemeText.bodyR14,
                    ),
                    Text(
                      orderModel.tableNumber,
                      style: ThemeText.bodyT14,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "• ${orderModel.menuName} x ${orderModel.quantity}",
                      style: ThemeText.bodyR14,
                    ),
                    Text(
                      priceFormat.format(
                        orderModel.priceMenu,
                      ),
                      style: ThemeText.bodyR14,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: ThemeText.bodyB14,
                    ),
                    Text(
                      priceFormat.format(orderModel.totalPrice),
                      style: ThemeText.bodyB14,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Payment Method',
                      style: ThemeText.bodyR14,
                    ),
                    Text(
                      orderModel.paymentMethods,
                      style: ThemeText.bodyT14,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
