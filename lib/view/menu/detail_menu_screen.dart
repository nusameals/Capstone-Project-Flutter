import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nusameals/themes/constant.dart';

class DetailMenuScreen extends StatefulWidget {
  const DetailMenuScreen({super.key});

  @override
  State<DetailMenuScreen> createState() => _DetailMenuScreenState();
}

class _DetailMenuScreenState extends State<DetailMenuScreen> {
  final priceFormat =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    final item = arguments != null ? arguments as Map<String, dynamic> : null;
    if (item == null) {
      return const Scaffold(
        body: Center(
          child: Text('Data tidak tersedia'),
        ),
      );
    }
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              item['imageProduct'],
              width: MediaQuery.of(context).size.width,
              height: 320,
              fit: BoxFit.cover,
            ),
            Positioned(
                top: 10,
                left: 10,
                child: IconButton(
                  onPressed: () {},
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
                )),
            ListView(
              children: [
                const SizedBox(
                  height: 330,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(5),
                    ),
                    color: ColorTheme.light1,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['nameProduct'],
                        style: ThemeText.bodyT18,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                item['lokasi'],
                                style: ThemeText.bodyR14,
                              ),
                              Text(
                                item['kalori'],
                                style: ThemeText.bodyR14,
                              ),
                            ],
                          ),
                          Text(
                            priceFormat.format(int.parse(
                              item['price'],
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
                        'Soto ayam berasal dari daerah DKI Jakarta dan juga merupakan salah satu makanan nusantara populer.',
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
                        'Daging ayam, bawang merah, bawang putih, kemiri, kunyit, jahe dan minyak zaitun.',
                        style: ThemeText.bodyR14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                decoration: const BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(color: ColorTheme.dark5))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorTheme.light1,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 52,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: const BorderSide(color: ColorTheme.primaryBlue),
                        ),
                      ),
                      child: Text(
                        'Add To Cart',
                        style: ThemeText.bodyR14B,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorTheme.primaryBlue,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 52,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Text(
                        'Order Now',
                        style: ThemeText.bodyB145W,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
