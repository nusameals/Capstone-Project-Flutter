// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:nusameals/view/scan/scan_screen.dart';
import 'package:provider/provider.dart';
import '../../themes/constant.dart';
import '../../view_model/menu_view_model.dart';
import '../component/card_product.dart';

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
  int index = 0;
  void _handleTabSelection() {
    setState(() {
      index = widget.tabController.index;
    });
  }

  @override
  void initState() {
    super.initState();
    Provider.of<MenuViewModel>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final modelMenu = Provider.of<MenuViewModel>(context);
    int index = widget.tabController.index;

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
                        itemCount: modelMenu.listMenu
                            .where((menu) => menu.idCategory == '1')
                            .length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          final filteredMenu = modelMenu.listMenu
                              .where((menu) => menu.idCategory == '1')
                              .toList();
                          final menu = filteredMenu[index];
                          return GestureDetector(
                            onTap: () {},
                            child: CardProduct(
                                imageProduct: menu.images,
                                nameProduct: menu.name,
                                city: menu.city,
                                price: menu.price,
                                kalori: menu.calorie),
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
                        itemCount: modelMenu.listMenu
                            .where((menu) => menu.idCategory == '2')
                            .length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          final filteredMenu = modelMenu.listMenu
                              .where((menu) => menu.idCategory == '2')
                              .toList();
                          final menu = filteredMenu[index];
                          return GestureDetector(
                            onTap: () {},
                            child: CardProduct(
                                imageProduct: menu.images,
                                nameProduct: menu.name,
                                city: menu.city,
                                price: menu.price,
                                kalori: menu.calorie),
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
                        itemCount: modelMenu.listMenu
                            .where((menu) => menu.idCategory == '3')
                            .length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          final filteredMenu = modelMenu.listMenu
                              .where((menu) => menu.idCategory == '3')
                              .toList();
                          final menu = filteredMenu[index];
                          return GestureDetector(
                            onTap: () {},
                            child: CardProduct(
                                imageProduct: menu.images,
                                nameProduct: menu.name,
                                city: menu.city,
                                price: menu.price,
                                kalori: menu.calorie),
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
