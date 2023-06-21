// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../themes/constant.dart';

class CardMyOrder extends StatelessWidget {
  final String id;
  final String dateTime;
  final String price;
  final String imageUrl;
  const CardMyOrder({
    Key? key,
    required this.id,
    required this.dateTime,
    required this.price,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final priceFormat =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffD8D8D8), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                child: Image.network(
                  imageUrl,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    id,
                    style: ThemeText.bodyB165,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(dateTime, style: ThemeText.bodyR12),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              priceFormat.format(
                int.parse(price),
              ),
              style: ThemeText.bodyB165,
            ),
          ),
        ],
      ),
    );
  }
}
