import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nusameals/themes/constant.dart';
import 'package:nusameals/view/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../view_model/cart_view_model.dart';
import '../../view_model/my_order_view_model.dart';
import '../component/button_primary.dart';
import '../component/costum_snackbar.dart';
import '../home/home_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final priceFormat =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);

  // ignore: unused_field
  final TextEditingController _controller = TextEditingController();
  String _selectedPaymentMethod = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CartViewModel>(context, listen: false).getCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    final modelCart = Provider.of<CartViewModel>(context);
    final modelOrder = Provider.of<MyOrderViewModel>(context);
    final bool isLoading = modelCart.isLoading;
    int getTotalPrice() {
      int totalPrice = 0;
      for (var item in modelCart.listMenuCart) {
        int itemTotal = int.parse(item.price) * int.parse(item.qty);
        totalPrice += itemTotal;
      }
      return totalPrice;
    }

    // int totalPrice = modelCart.getTotalPrice();
    if (modelCart.listMenuCart.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorTheme.light1,
          elevation: 1,
          leading: IconButton(
            padding: const EdgeInsets.only(left: 20),
            icon: const Icon(
              Icons.arrow_back,
              color: ColorTheme.dark1,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Cart',
            style: ThemeText.subHeadingR20,
          ),
        ),
        body: isLoading
            ? const Center(
                child: SpinKitCircle(
                  color: ColorTheme.primaryBlue,
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.remove_shopping_cart_outlined,
                      color: ColorTheme.dark5,
                      size: 24,
                    ),
                    Text(
                      "No menu available in the cart",
                      style: ThemeText.bodyR14Dark4,
                    ),
                  ],
                ),
              ),
      );
    }
    return Theme(
      data: Theme.of(context).copyWith(useMaterial3: false),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorTheme.light1,
          elevation: 1,
          leading: IconButton(
            padding: const EdgeInsets.only(left: 20),
            icon: const Icon(
              Icons.arrow_back,
              color: ColorTheme.dark1,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Cart',
            style: ThemeText.subHeadingR20,
          ),
        ),
        body: isLoading
            ? const Center(
                child: SpinKitCircle(
                  color: ColorTheme.primaryBlue,
                ),
              )
            : Stack(
                children: [
                  ListView(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: modelCart.listMenuCart.length,
                        itemBuilder: (context, index) {
                          final item = modelCart.listMenuCart[index];
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            margin: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      child: Image.network(
                                        item.images,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  item.name,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      ThemeText.subHeadingB18,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  showModalBottomSheet<void>(
                                                      context: context,
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .vertical(
                                                          top: Radius.circular(
                                                              20),
                                                        ),
                                                      ),
                                                      builder: (BuildContext
                                                          context) {
                                                        return Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(16),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      icon: const Icon(
                                                                          Icons
                                                                              .arrow_back)),
                                                                  Text(
                                                                    'Confirmation',
                                                                    style: ThemeText
                                                                        .subHeadingR20,
                                                                  ),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                  height: 16),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        16),
                                                                child: Text(
                                                                  'Do you want to remove "${item.name}" ?',
                                                                  style: ThemeText
                                                                      .bodyR18,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  height: 16),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        backgroundColor:
                                                                            ColorTheme.light1,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(50),
                                                                          side:
                                                                              const BorderSide(color: ColorTheme.primaryBlue),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        'No',
                                                                        style: ThemeText
                                                                            .bodyR14B,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 6,
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          modelCart
                                                                              .listMenuCart
                                                                              .removeAt(index);
                                                                        });
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        backgroundColor:
                                                                            ColorTheme.secondaryDanger,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(50),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        'Yes',
                                                                        style: ThemeText
                                                                            .bodyB145W,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      });
                                                },
                                                child: const Icon(
                                                  Icons.delete_outline,
                                                  size: 20,
                                                  color: ColorTheme
                                                      .secondaryDanger,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    item.city,
                                                    style:
                                                        ThemeText.bodyR14Dark4,
                                                  ),
                                                  Text(
                                                    '${item.calorie} kkal',
                                                    style:
                                                        ThemeText.bodyB14Dark4,
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                priceFormat.format(
                                                  int.parse(
                                                    item.price,
                                                  ),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Quantity',
                                      style: ThemeText.bodyR16,
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              int currentQuantity = int.parse(
                                                  modelCart
                                                      .listMenuCart[index].qty);
                                              if (currentQuantity > 0) {
                                                modelCart.listMenuCart[index]
                                                        .qty =
                                                    (currentQuantity - 1)
                                                        .toString();
                                              }
                                            });
                                          },
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  bottomLeft:
                                                      Radius.circular(20)),
                                              color: ColorTheme.primaryBlue,
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 9),
                                            child: const Icon(
                                              Icons.remove,
                                              size: 16,
                                              color: ColorTheme.light1,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 60,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: ColorTheme.primaryBlue,
                                              width: 2,
                                            ),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 3),
                                          child: Text(
                                            modelCart.listMenuCart[index].qty,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              int currentQuantity = int.parse(
                                                  modelCart
                                                      .listMenuCart[index].qty);
                                              modelCart
                                                      .listMenuCart[index].qty =
                                                  (currentQuantity + 1)
                                                      .toString();
                                            });
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 9),
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              color: ColorTheme.primaryBlue,
                                            ),
                                            child: const Icon(
                                              Icons.add,
                                              size: 16,
                                              color: ColorTheme.light1,
                                            ),
                                          ),
                                        ),
                                      ],
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
                          );
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: ColorTheme.primaryBlue,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  modelCart.selectDineIn();
                                },
                                child: Container(
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: modelCart.dineInSelected
                                        ? ColorTheme.primaryBlue20
                                        : ColorTheme.light1,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      modelCart.dineInSelected
                                          ? const Icon(
                                              Icons.check,
                                              color: ColorTheme.dark1,
                                              size: 18,
                                            )
                                          : const SizedBox(),
                                      const SizedBox(width: 4),
                                      Text(
                                        'Dine in',
                                        style: GoogleFonts.poppins(
                                          color: modelCart.dineInSelected
                                              ? ColorTheme.dark1
                                              : ColorTheme.dark1,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 35,
                              color: ColorTheme.primaryBlue,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  modelCart.selectTakeAway();
                                },
                                child: Container(
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: modelCart.takeAwaySelected
                                        ? ColorTheme.primaryBlue20
                                        : ColorTheme.light1,
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      modelCart.takeAwaySelected
                                          ? const Icon(
                                              Icons.check,
                                              color: ColorTheme.dark1,
                                              size: 18,
                                            )
                                          : const SizedBox(),
                                      const SizedBox(width: 4),
                                      Text(
                                        'Take away',
                                        style: GoogleFonts.poppins(
                                          color: modelCart.dineInSelected
                                              ? ColorTheme.dark1
                                              : ColorTheme.dark1,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 15, 20, 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Table Number',
                              style: ThemeText.bodyB145,
                            ),
                            Container(
                              width: 55,
                              height: 30,
                              decoration: BoxDecoration(
                                color: modelCart.dineInSelected
                                    ? ColorTheme.primaryBlue20
                                    : ColorTheme.light4,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              child: DropdownButton<int>(
                                value: modelCart.tableNumber,
                                onChanged: modelCart.dineInSelected
                                    ? (int? newValue) {
                                        modelCart.setSelectedNumber(newValue!);
                                      }
                                    : null,
                                underline: Container(),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: ColorTheme.dark1,
                                ),
                                items: <int>[0, 1, 2, 3, 4, 5]
                                    .map<DropdownMenuItem<int>>((int value) {
                                  return DropdownMenuItem<int>(
                                    value: value,
                                    child: Text(
                                      value.toString(),
                                      style: const TextStyle(),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Divider(
                          thickness: 1,
                          color: ColorTheme.primaryBlue60,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Orders Detail',
                              style: ThemeText.bodyB16,
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: modelCart.listMenuCart.length,
                              itemBuilder: (context, index) {
                                final item = modelCart.listMenuCart[index];
                                if (item.qty.isNotEmpty) {
                                  return SizedBox(
                                    width: double.infinity,
                                    height: 30,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Text(
                                            '• ${item.name} x ${item.qty}',
                                            style: ThemeText.bodyR14,
                                          ),
                                        ),
                                        Text(
                                          priceFormat.format(
                                              int.parse(item.price) *
                                                  int.parse(item.qty)),
                                          style: ThemeText.bodyR14,
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              },
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: ThemeText.bodyB16,
                                ),
                                Text(
                                  priceFormat.format(getTotalPrice()),
                                  style: ThemeText.bodyB16,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      decoration: const BoxDecoration(
                        border: Border.symmetric(
                          horizontal: BorderSide(color: ColorTheme.dark5),
                        ),
                        color: ColorTheme.light1,
                      ),
                      child: PrimaryButton(
                          text: "Make an order",
                          onPressed: () async {
                            // ignore: use_build_context_synchronously
                            showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                builder: (BuildContext context) {
                                  return StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter setState) {
                                    return Container(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  icon: const Icon(
                                                      Icons.arrow_back)),
                                              Text(
                                                'Payment Method',
                                                style: ThemeText.subHeadingR20,
                                              ),
                                            ],
                                          ),
                                          ListTile(
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  "assets/images/cash.png",
                                                  width: 30,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text('Cash',
                                                    style: ThemeText
                                                        .subHeadingB20),
                                              ],
                                            ),
                                            leading: Radio(
                                              value: 'Cash',
                                              groupValue:
                                                  _selectedPaymentMethod,
                                              onChanged: (value) {
                                                setState(() {
                                                  _selectedPaymentMethod =
                                                      value as String;
                                                });
                                                modelCart
                                                    .setSelectedPaymentMethod(
                                                        _selectedPaymentMethod);
                                              },
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 0),
                                          ),
                                          ListTile(
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  "assets/images/debit.png",
                                                  width: 30,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text('Debit Card',
                                                    style: ThemeText
                                                        .subHeadingB20),
                                              ],
                                            ),
                                            leading: Radio(
                                              value: 'Debit Card',
                                              groupValue:
                                                  _selectedPaymentMethod,
                                              onChanged: (value) {
                                                setState(() {
                                                  _selectedPaymentMethod =
                                                      value as String;
                                                });
                                                modelCart
                                                    .setSelectedPaymentMethod(
                                                        _selectedPaymentMethod);
                                              },
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 0),
                                          ),
                                          ListTile(
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  "assets/images/dana.png",
                                                  width: 30,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text('Dana',
                                                    style: ThemeText
                                                        .subHeadingB20),
                                              ],
                                            ),
                                            leading: Radio(
                                              value: 'Dana',
                                              groupValue:
                                                  _selectedPaymentMethod,
                                              onChanged: (value) {
                                                setState(() {
                                                  _selectedPaymentMethod =
                                                      value as String;
                                                });
                                                modelCart
                                                    .setSelectedPaymentMethod(
                                                        _selectedPaymentMethod);
                                              },
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 0),
                                          ),
                                          ListTile(
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  "assets/images/ovo.png",
                                                  width: 30,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text('Ovo',
                                                    style: ThemeText
                                                        .subHeadingB20),
                                              ],
                                            ),
                                            leading: Radio(
                                              value: 'Ovo',
                                              groupValue:
                                                  _selectedPaymentMethod,
                                              onChanged: (value) {
                                                setState(() {
                                                  _selectedPaymentMethod =
                                                      value as String;
                                                });
                                                modelCart
                                                    .setSelectedPaymentMethod(
                                                        _selectedPaymentMethod);
                                              },
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 0),
                                          ),
                                          ListTile(
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  "assets/images/gopay.png",
                                                  width: 30,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text('Gopay',
                                                    style: ThemeText
                                                        .subHeadingB20),
                                              ],
                                            ),
                                            leading: Radio(
                                              value: 'Gopay',
                                              groupValue:
                                                  _selectedPaymentMethod,
                                              onChanged: (value) {
                                                setState(() {
                                                  _selectedPaymentMethod =
                                                      value as String;
                                                });
                                                modelCart
                                                    .setSelectedPaymentMethod(
                                                        _selectedPaymentMethod);
                                              },
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 0),
                                          ),
                                          const SizedBox(height: 10),
                                          const Divider(
                                            thickness: 2,
                                            indent: 10,
                                            endIndent: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 7),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Total',
                                                      style: ThemeText.bodyB16,
                                                    ),
                                                    Text(
                                                      priceFormat.format(
                                                          getTotalPrice()),
                                                      style: ThemeText.bodyB16,
                                                    )
                                                  ],
                                                ),
                                                ElevatedButton(
                                                  onPressed: () async {
                                                    SharedPreferences prefs =
                                                        await SharedPreferences
                                                            .getInstance();
                                                    String userId =
                                                        prefs.getString('id') ??
                                                            '';
                                                    int totalAmount =
                                                        getTotalPrice();
                                                    final orderId =
                                                        modelOrder.orderId;

                                                    final tableNumber =
                                                        modelCart.tableNumber
                                                            .toString();
                                                    final item = modelCart
                                                        .listMenuCart[0];
                                                    final menuId =
                                                        int.parse(item.idMenu);
                                                    final typeOrder =
                                                        modelCart.dineInSelected
                                                            ? 'Dine In'
                                                            : 'Take away';
                                                    final quantity = modelCart
                                                        .listMenuCart[0].qty;
                                                    // ignore: use_build_context_synchronously
                                                    Provider.of<MyOrderViewModel>(
                                                            context,
                                                            listen: false)
                                                        .createOrder(
                                                            int.parse(userId),
                                                            menuId,
                                                            typeOrder,
                                                            int.parse(quantity),
                                                            tableNumber,
                                                            _selectedPaymentMethod);
                                                    // ignore: use_build_context_synchronously
                                                    Provider.of<MyOrderViewModel>(
                                                            context,
                                                            listen: false)
                                                        .payments(orderId,
                                                            totalAmount);
                                                    modelCart.listMenuCart
                                                        .clear();
                                                    // ignore: use_build_context_synchronously
                                                    CustomSnackbar.showSnackbar(
                                                      context,
                                                      'Thanks for order, please wait...',
                                                      actionText: 'Order more',
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const HomeScreen()));
                                                      },
                                                    );
                                                    // ignore: use_build_context_synchronously
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const MainScreen()));
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        ColorTheme.primaryBlue,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 60,
                                                      vertical: 8,
                                                    ),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Checkout',
                                                    style: ThemeText.bodyB145W,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  });
                                });
                          }),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
