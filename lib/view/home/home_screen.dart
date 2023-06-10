// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nusameals/view/scan/scan_screen.dart';
import '../../themes/constant.dart';
import '../component/card_product.dart';
import '../menu/detail_menu_screen.dart';
import '../menu/dummy.dart';

class HomeScreen extends StatefulWidget {
  final Function? onPressedLowCalories;
  final Function? onPressedSavingPackages;
  final Function? onPressedSpecialForYou;
  const HomeScreen({
    Key? key,
    this.onPressedLowCalories,
    this.onPressedSavingPackages,
    this.onPressedSpecialForYou,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final List<String> imgSlider = [
    'carousel.png',
    'carousel2.png',
  ];

  @override
  Widget build(BuildContext context) {
    final CarouselSlider autoPlayImage = CarouselSlider(
        items: imgSlider.map((fileImage) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Image.asset(
                'assets/images/$fileImage',
              ),
            ),
          );
        }).toList(),
        options: CarouselOptions(
          viewportFraction: 1,
          height: 500,
          autoPlay: true,
          enlargeCenterPage: true,
        ));
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(74),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        color: ColorTheme.primaryBlue,
                      ),
                      width: double.infinity,
                      height: 70,
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.transparent,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 22,
                  right: 22,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: ColorTheme.light1,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: ColorTheme.light4,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ScanScreen()));
                              },
                              icon: const Icon(
                                Icons.qr_code_scanner,
                                size: 44,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Scan Menu',
                              style: ThemeText.bodyR12,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: widget.onPressedLowCalories as void
                                  Function()?,
                              icon: const Icon(
                                Icons.restaurant_menu,
                                size: 44,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Low Calories',
                              style: ThemeText.bodyR12,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: widget.onPressedSavingPackages as void
                                  Function()?,
                              icon: const Icon(
                                Icons.fastfood,
                                size: 44,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Saving Packages',
                              style: ThemeText.bodyR12,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          pinned: true,
          forceElevated: true,
          expandedHeight: 300,
          flexibleSpace: FlexibleSpaceBar(
            background: SizedBox(
              width: double.infinity,
              child: ListView(
                children: [
                  Container(
                    color: ColorTheme.primaryBlue,
                    height: 170,
                    child: autoPlayImage,
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Special for you',
                      style: ThemeText.bodyB16,
                    ),
                    IconButton(
                        onPressed:
                            widget.onPressedSpecialForYou as void Function()?,
                        icon: const Icon(
                          Icons.arrow_forward,
                          size: 22,
                        ))
                  ],
                ),
                SizedBox(
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailMenuScreen(),
                              settings: RouteSettings(arguments: item),
                            ),
                          );
                        },
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
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
