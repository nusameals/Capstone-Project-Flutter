import 'package:flutter/material.dart';

import '../../themes/constant.dart';
import '../component/card_product.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List dataMenu = [
    {
      'imageProduct': "assets/images/gambar_soto.png",
      'nameProduct': 'Soto Ayam',
      'lokasi': 'Jakarta',
      'price': '25000',
      'kalori': '215 kkal'
    },
    {
      'imageProduct': "assets/images/rendang.png",
      'nameProduct': 'Rendang',
      'lokasi': 'Jakarta',
      'price': '10000',
      'kalori': '468 kkal'
    },
    {
      'imageProduct': "assets/images/ayam_taliwang.png",
      'nameProduct': 'Ayam Taliwang',
      'lokasi': 'Taliwang',
      'price': '35000',
      'kalori': '459 kkal'
    },
    {
      'imageProduct': "assets/images/gudeg.png",
      'nameProduct': 'Gudeg',
      'lokasi': 'Yogyakarta',
      'price': '25000',
      'kalori': '1027,75 kkal'
    },
    {
      'imageProduct': "assets/images/gulai_ikan_patin.png",
      'nameProduct': 'Gulai Ikan Patin',
      'lokasi': 'Jakarta',
      'price': '20000',
      'kalori': '132 kkal'
    },
    {
      'imageProduct': "assets/images/rujak_cingur.png",
      'nameProduct': 'Rujak Cingur',
      'lokasi': 'Jawa Timur',
      'price': '18000',
      'kalori': '285 kkal'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: light4,
                    ),
                    child: const TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: dark1,
                          size: 18,
                        ),
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: dark1,
                          fontSize: 16,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    Material(
                      child: Container(
                        height: 55,
                        color: Colors.transparent,
                        child: TabBar(
                          dividerColor: Colors.blue[50],
                          physics: const ClampingScrollPhysics(),
                          padding: const EdgeInsets.all(10),
                          unselectedLabelColor: dark1,
                          labelColor: dark1,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: primaryBlue20,
                          ),
                          tabs: [
                            Tab(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: primaryBlue20, width: 1),
                                ),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "For You",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: dark1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: primaryBlue20, width: 1),
                                ),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Low Calories",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: dark1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: primaryBlue20, width: 1),
                                ),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Saving Package",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: dark1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      color: light5,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height - 200,
                          child: TabBarView(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: GridView.builder(
                                    itemCount: dataMenu.length,
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 12,
                                            mainAxisSpacing: 10),
                                    itemBuilder: (context, index) {
                                      final item = dataMenu[index];
                                      return GestureDetector(
                                        onTap: () {},
                                        child: CardProduct(
                                            imageProduct: item['imageProduct'],
                                            nameProduct: item['nameProduct'],
                                            lokasi: item['lokasi'],
                                            price: item['price'],
                                            kalori: item['kalori']),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: GridView.builder(
                                    itemCount: dataMenu.length,
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 12,
                                            mainAxisSpacing: 10),
                                    itemBuilder: (context, index) {
                                      final item = dataMenu[index];
                                      return GestureDetector(
                                        onTap: () {},
                                        child: CardProduct(
                                          imageProduct: item['imageProduct'],
                                          nameProduct: item['nameProduct'],
                                          lokasi: item['lokasi'],
                                          price: item['price'],
                                          kalori: item['kalori'],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: GridView.builder(
                                    itemCount: dataMenu.length,
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 12,
                                            mainAxisSpacing: 10),
                                    itemBuilder: (context, index) {
                                      final item = dataMenu[index];
                                      return GestureDetector(
                                        onTap: () {},
                                        child: CardProduct(
                                            imageProduct: item['imageProduct'],
                                            nameProduct: item['nameProduct'],
                                            lokasi: item['lokasi'],
                                            price: item['price'],
                                            kalori: item['kalori']),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryBlue,
        onPressed: () {},
        child: const Icon(
          Icons.qr_code_scanner,
        ),
      ),
    );
  }
}
