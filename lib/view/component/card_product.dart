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
      decoration: BoxDecoration(
        color: ColorTheme.light1,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: ColorTheme.light4,
          width: 2,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.asset(
                imageProduct,
                height: 95,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                nameProduct,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: ThemeText.bodyB14,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                lokasi,
                style: ThemeText.bodyR12Dark5,
              ),
            ),
            const SizedBox(
              height: 2,
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
                      style: ThemeText.bodyB14,
                    ),
                    Text(
                      kalori,
                      style: ThemeText.bodyR12Dark5,
                    )
                  ]),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
