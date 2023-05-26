import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nusameals/themes/constant.dart';
import '../component/button_primary.dart';
import '../menu/dummy.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final priceFormat =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
  bool dineInSelected = false;
  bool takeAwaySelected = false;
  int selectedNumber = 0;

  void incrementQuantity(int index) {
    setState(() {
      dataMenuInCart[index]['quantity']++;
    });
  }

  void decrementQuantity(int index) {
    setState(() {
      if (dataMenuInCart[index]['quantity'] > 0) {
        dataMenuInCart[index]['quantity']--;
      }
    });
  }

  int getTotalPrice() {
    int totalPrice = 0;
    for (var item in dataMenuInCart) {
      int price = int.parse(item['price']);
      int quantity = item['quantity'];
      totalPrice += price * quantity;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 22,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Cart',
                      style: ThemeText.subHeadingR20,
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: dataMenuInCart.length,
                    itemBuilder: (context, index) {
                      final item = dataMenuInCart[index];
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
                                  child: Image.asset(
                                    item['imageProduct'],
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
                                          Text(
                                            item['nameProduct'],
                                            style: ThemeText.subHeadingB18,
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: const Icon(
                                              Icons.delete_outline,
                                              size: 18,
                                              color: ColorTheme.secondaryDanger,
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
                                            children: [
                                              Text(
                                                item['lokasi'],
                                                style: ThemeText.bodyR14Dark4,
                                              ),
                                              Text(
                                                item['kalori'],
                                                style: ThemeText.bodyB14Dark4,
                                              ),
                                            ],
                                          ),
                                          Text(
                                            priceFormat.format(
                                              int.parse(
                                                item['price'],
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
                                        decrementQuantity(index);
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Text(
                                        item['quantity'].toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        incrementQuantity(index);
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
                            Divider(
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
                              setState(() {
                                dineInSelected = true;
                                takeAwaySelected = false;
                              });
                            },
                            child: Container(
                              height: 29,
                              decoration: BoxDecoration(
                                color: dineInSelected
                                    ? ColorTheme.primaryBlue20
                                    : ColorTheme.light4,
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
                                    'Dine In',
                                    style: TextStyle(
                                      color: dineInSelected
                                          ? ColorTheme.dark1
                                          : ColorTheme.dark1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 30,
                          color: ColorTheme.primaryBlue,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                dineInSelected = false;
                                takeAwaySelected = true;
                              });
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: takeAwaySelected
                                    ? ColorTheme.primaryBlue20
                                    : ColorTheme.light4,
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
                                      : SizedBox(),
                                  SizedBox(width: 4),
                                  Text(
                                    'Take Away',
                                    style: TextStyle(
                                      color: takeAwaySelected
                                          ? ColorTheme.dark1
                                          : ColorTheme.dark1,
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
                                  }
                                : null,
                            underline: Container(),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: ColorTheme.dark1,
                            ), // Ikon panah ke bawah
                            items: <int>[0, 1, 2, 3, 4, 5]
                                .map<DropdownMenuItem<int>>((int value) {
                              return DropdownMenuItem<int>(
                                value: value,
                                child: Text(
                                  value.toString(),
                                  style: TextStyle(),
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
                ],
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
                      itemCount: dataMenuInCart.length,
                      itemBuilder: (context, index) {
                        final item = dataMenuInCart[index];
                        if (item['quantity'] >= 0) {
                          return Container(
                            width: double.infinity,
                            height: 30,
                            // margin: EdgeInsets.symmetric(vertical: 5),
                            child: ListTile(
                              // leading: Icon(
                              //   Icons.circle,
                              //   size: 8,
                              // ),
                              title: Text(
                                ' - ${item['nameProduct']} x ${item['quantity']}',
                                style: ThemeText.bodyR14,
                              ),
                              trailing: Text(
                                priceFormat.format(int.parse(item['price']) *
                                    item['quantity']),
                                style: ThemeText.bodyR14,
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 5),
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: ThemeText.bodyB14,
                        ),
                        Text(
                          priceFormat.format(getTotalPrice()),
                          style: ThemeText.bodyB14,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
                color: ColorTheme.primaryBlue20,
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child:
                      PrimaryButton(text: "Make an order", onPressed: () {})),
            ],
          ),
        ),
      ),
    );
  }
}
