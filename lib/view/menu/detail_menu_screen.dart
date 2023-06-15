import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nusameals/themes/constant.dart';
import 'package:nusameals/view/cart/cart_screen.dart';
import 'package:nusameals/view/cart/order_screen.dart';
import 'package:nusameals/view_model/cart_view_model.dart';
import 'package:provider/provider.dart';
import '../../model/menu_model.dart';
import '../component/costum_snackbar.dart';

class DetailMenuScreen extends StatefulWidget {
  final MenuModel menuModel;
  const DetailMenuScreen(this.menuModel);

  @override
  State<DetailMenuScreen> createState() => _DetailMenuScreenState();
}

class _DetailMenuScreenState extends State<DetailMenuScreen> {
  final priceFormat =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              widget.menuModel.images,
              width: MediaQuery.of(context).size.width,
              height: 340,
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color.fromRGBO(0, 0, 0, 0.6),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: ColorTheme.light1,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 290,
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(5),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.menuModel.name,
                              style: ThemeText.bodyT18,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.menuModel.city,
                                      style: ThemeText.bodyR14,
                                    ),
                                    Text(
                                      '${widget.menuModel.calorie} kkal',
                                      style: ThemeText.bodyR14,
                                    ),
                                  ],
                                ),
                                Text(
                                  priceFormat.format(int.parse(
                                    widget.menuModel.price,
                                  )),
                                  style: ThemeText.bodyB20,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(
                              thickness: 1,
                              color: ColorTheme.primaryBlue60,
                            ),
                            Text(
                              'Description',
                              style: ThemeText.bodyT18,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.menuModel.description,
                              style: ThemeText.bodyR14,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(
                              thickness: 1,
                              color: ColorTheme.primaryBlue60,
                            ),
                            Text(
                              'Ingredients',
                              style: ThemeText.bodyT18,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.menuModel.ingredients,
                              style: ThemeText.bodyR14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(color: ColorTheme.dark5),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            final cartViewModel = Provider.of<CartViewModel>(
                                context,
                                listen: false);
                            cartViewModel.addToCart(widget.menuModel, context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CartScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorTheme.light1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: const BorderSide(
                                  color: ColorTheme.primaryBlue),
                            ),
                          ),
                          child: Text(
                            'Add To Cart',
                            style: ThemeText.bodyR14B,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OrderScreen(widget.menuModel)));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorTheme.primaryBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Text(
                            'Order Now',
                            style: ThemeText.bodyB145W,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
