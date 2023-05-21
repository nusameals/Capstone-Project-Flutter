import 'package:flutter/material.dart';
import 'package:nusameals/view/main_screen.dart';
import 'package:nusameals/view/menu_test_screen.dart';

import 'component/card_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0669BD),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.account_circle_outlined,
                size: 30,
              )),
        ),
        title: const Text('Name'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                // Aksi ketika tombol notifikasi diklik
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 260,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xff0669BD),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          'assets/images/carousel.png',
                          height: 160,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 200,
                  left: 22,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    height: 110,
                    width: 370,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Color.fromARGB(255, 220, 220, 220),
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                //page scan
                              },
                              icon: const Icon(
                                Icons.qr_code_scanner,
                                size: 30,
                              ),
                            ),
                            Text('Scan Menu'),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainScreen(
                                              selectedIndex: 1,
                                            )));
                              },
                              icon: const Icon(
                                Icons.restaurant_menu,
                                size: 30,
                              ),
                            ),
                            Text('Low Calories'),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainScreen(
                                              selectedIndex: 1,
                                            )));
                              },
                              icon: const Icon(
                                Icons.fastfood,
                                size: 30,
                              ),
                            ),
                            Text('Saving Packages'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Special for you',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w600),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward,
                            size: 28,
                          ))
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                child: GridView(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 10),
                  children: const [
                    CardProduct(
                        imageProduct: "assets/images/gambar_soto.png",
                        nameProduct: "Soto",
                        lokasi: "Kudus",
                        price: "50000",
                        kalori: "220 kkal"),
                    CardProduct(
                        imageProduct: "assets/images/gambar_soto.png",
                        nameProduct: "Soto",
                        lokasi: "Kudus",
                        price: "50000",
                        kalori: "220 kkal"),
                    CardProduct(
                        imageProduct: "assets/images/gambar_soto.png",
                        nameProduct: "Soto",
                        lokasi: "Kudus",
                        price: "50000",
                        kalori: "220 kkal"),
                    CardProduct(
                        imageProduct: "assets/images/gambar_soto.png",
                        nameProduct: "Soto",
                        lokasi: "Kudus",
                        price: "50000",
                        kalori: "220 kkal"),
                    CardProduct(
                        imageProduct: "assets/images/gambar_soto.png",
                        nameProduct: "Soto",
                        lokasi: "Kudus",
                        price: "50000",
                        kalori: "220 kkal"),
                    CardProduct(
                        imageProduct: "assets/images/gambar_soto.png",
                        nameProduct: "Soto",
                        lokasi: "Kudus",
                        price: "50000",
                        kalori: "220 kkal"),
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
