// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:nusameals/view/scan/scan_screen.dart';
import '../../themes/constant.dart';
import '../component/card_product.dart';
import 'dummy.dart';

class MenuScreen extends StatefulWidget {
  final TabController tabController;
  const MenuScreen({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: TabBarView(
                controller: widget.tabController,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: GridView.builder(
                        itemCount: dataLowCalories.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          final item = dataLowCalories[index];
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: GridView.builder(
                        itemCount: dataSavingPackages.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          final item = dataSavingPackages[index];
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorTheme.primaryBlue,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ScanScreen()));
        },
        child: const Icon(
          Icons.qr_code_scanner,
        ),
      ),
    );
  }
}
