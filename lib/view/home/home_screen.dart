// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nusameals/view/scan/scan_screen.dart';
import '../../themes/constant.dart';
import '../component/card_product.dart';
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
          height: 180,
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 2.0,
        ));
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 230,
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                  decoration: const BoxDecoration(
                    color: ColorTheme.primaryBlue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 160,
                        child: autoPlayImage,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 170,
                  left: 22,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    height: 95,
                    width: 370,
                    decoration: BoxDecoration(
                      color: ColorTheme.light1,
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
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: GridView.builder(
                  itemCount: dataMenu.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
    );
  }
}
