// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../themes/constant.dart';

class CardProduct extends StatelessWidget {
  final String imageProduct;
  final String nameProduct;
  final String lokasi;
  final String price;
  final String kalori;
  const CardProduct({
    Key? key,
    required this.imageProduct,
    required this.nameProduct,
    required this.lokasi,
    required this.price,
    required this.kalori,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final priceFormat =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);

    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: light1,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color.fromARGB(255, 242, 241, 241),
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Image.asset(
              imageProduct,
              height: 100,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              nameProduct,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: dark1,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              lokasi,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: dark5,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    priceFormat.format(
                      int.parse(price),
                    ),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: dark1,
                    ),
                  ),
                  Text(
                    kalori,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: dark5,
                    ),
                  )
                ]),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
