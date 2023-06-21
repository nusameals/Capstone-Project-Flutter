import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../model/menu_model.dart';
import '../../themes/constant.dart';
import '../../view_model/cart_view_model.dart';
import '../component/button_primary.dart';
import '../component/costum_snackbar.dart';

class OrderScreen extends StatefulWidget {
  final MenuModel menuModel;
  const OrderScreen(this.menuModel, {super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final priceFormat =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
  bool dineInSelected = false;
  bool takeAwaySelected = false;
  int selectedNumber = 0;
  int quantity = 1;
  final TextEditingController _controller = TextEditingController();
  String _selectedPaymentMethod = '';

  @override
  Widget build(BuildContext context) {
    final modelCart = Provider.of<CartViewModel>(context);

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
            'Order',
            style: ThemeText.subHeadingR20,
          ),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Image.network(
                              widget.menuModel.images,
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        widget.menuModel.name,
                                        style: ThemeText.subHeadingB18,
                                        overflow: TextOverflow.ellipsis,
                                        // maxLines: 1,
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
                                          widget.menuModel.city,
                                          style: ThemeText.bodyR14Dark4,
                                        ),
                                        Text(
                                          '${widget.menuModel.calorie} kkal',
                                          style: ThemeText.bodyB14Dark4,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      priceFormat.format(
                                        int.parse(
                                          widget.menuModel.price.toString(),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  if (quantity > 1) {
                                    setState(() {
                                      quantity--;
                                    });
                                  }
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20)),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: Text(
                                  quantity.toString(),
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
                                    quantity++;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 9),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
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
                            setState(() {
                              dineInSelected = true;
                              takeAwaySelected = false;
                            });
                            modelCart.setTakeAwaySelected(false);
                          },
                          child: Container(
                            height: 33,
                            decoration: BoxDecoration(
                              color: dineInSelected
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
                                dineInSelected
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
                                    color: dineInSelected
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
                            setState(() {
                              dineInSelected = false;
                              takeAwaySelected = true;
                            });
                            modelCart.setTakeAwaySelected(true);
                          },
                          child: Container(
                            height: 33,
                            decoration: BoxDecoration(
                              color: takeAwaySelected
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
                                takeAwaySelected
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
                                    color: dineInSelected
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
                          color: dineInSelected
                              ? ColorTheme.primaryBlue20
                              : ColorTheme.light4,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        child: DropdownButton<int>(
                          value: selectedNumber,
                          onChanged: dineInSelected
                              ? (int? newValue) {
                                  setState(() {
                                    selectedNumber = newValue!;
                                  });
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
                                textAlign: TextAlign.center,
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
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    '• Price',
                                    style: ThemeText.bodyR14,
                                  ),
                                ),
                                Text(
                                  priceFormat.format(int.parse(
                                      widget.menuModel.price.toString())),
                                  style: ThemeText.bodyR14,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    '• Quantity',
                                    style: ThemeText.bodyR14,
                                  ),
                                ),
                                Text(
                                  quantity.toString(),
                                  style: ThemeText.bodyR14,
                                ),
                              ],
                            ),
                          ],
                        ),
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
                            priceFormat.format(
                                int.parse(widget.menuModel.price.toString()) *
                                    quantity),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                decoration: const BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(color: ColorTheme.dark5),
                  ),
                  color: ColorTheme.light1,
                ),
                child: Builder(builder: (context) {
                  return PrimaryButton(
                    text: "Make an order",
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (BuildContext context) {
                          return StatefulBuilder(builder:
                              (BuildContext context, StateSetter setState) {
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
                                          icon: const Icon(Icons.arrow_back)),
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
                                            style: ThemeText.subHeadingB20),
                                      ],
                                    ),
                                    leading: Radio(
                                      value: 'Cash',
                                      groupValue: _selectedPaymentMethod,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedPaymentMethod =
                                              value as String;
                                        });
                                        modelCart.setSelectedPaymentMethod(
                                            _selectedPaymentMethod);
                                      },
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
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
                                            style: ThemeText.subHeadingB20),
                                      ],
                                    ),
                                    leading: Radio(
                                      value: 'Debit Card',
                                      groupValue: _selectedPaymentMethod,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedPaymentMethod =
                                              value as String;
                                        });
                                        modelCart.setSelectedPaymentMethod(
                                            _selectedPaymentMethod);
                                      },
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
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
                                            style: ThemeText.subHeadingB20),
                                      ],
                                    ),
                                    leading: Radio(
                                      value: 'Dana',
                                      groupValue: _selectedPaymentMethod,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedPaymentMethod =
                                              value as String;
                                        });
                                        modelCart.setSelectedPaymentMethod(
                                            _selectedPaymentMethod);
                                      },
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
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
                                            style: ThemeText.subHeadingB20),
                                      ],
                                    ),
                                    leading: Radio(
                                      value: 'Ovo',
                                      groupValue: _selectedPaymentMethod,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedPaymentMethod =
                                              value as String;
                                        });
                                        modelCart.setSelectedPaymentMethod(
                                            _selectedPaymentMethod);
                                      },
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
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
                                            style: ThemeText.subHeadingB20),
                                      ],
                                    ),
                                    leading: Radio(
                                      value: 'Gopay',
                                      groupValue: _selectedPaymentMethod,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedPaymentMethod =
                                              value as String;
                                        });
                                        modelCart.setSelectedPaymentMethod(
                                            _selectedPaymentMethod);
                                      },
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
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
                                          MainAxisAlignment.spaceBetween,
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
                                              priceFormat.format(int.parse(
                                                      widget.menuModel.price
                                                          .toString()) *
                                                  quantity),
                                              style: ThemeText.bodyB16,
                                            )
                                          ],
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Provider.of<CartViewModel>(context,
                                                    listen: false)
                                                .checkout(context);
                                            _controller.text =
                                                _selectedPaymentMethod;
                                            // final selectedPaymentMethod =
                                            //     _controller.text;
                                            CustomSnackbar.showSnackbar(
                                              context,
                                              'Thanks for order, please wait...',
                                              actionText: 'Order more',
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            );
                                            Navigator.pop(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                ColorTheme.primaryBlue,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 60,
                                              vertical: 8,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
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
                        },
                      );
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
