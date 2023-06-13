import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../themes/constant.dart';
import '../../view_model/menu_view_model.dart';
import '../component/card_product.dart';
import 'detail_menu_screen.dart';
import 'dummy.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List filteredDataMenu = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   filteredDataMenu = dataMenu;
  // }

  // void search(String query) {
  //   setState(() {
  //     filteredDataMenu = dataMenu
  //         .where((item) =>
  //             item['nameProduct']!.toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final modelCategory = Provider.of<MenuViewModel>(context);

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
          title: TextField(
            controller: _searchController,
            onChanged: (query) {
              modelCategory.search(query);
            },
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: ColorTheme.dark1,
              ),
              border: InputBorder.none,
            ),
            style: ThemeText.bodyR14,
          ),
          actions: [
            IconButton(
              padding: const EdgeInsets.only(right: 20),
              icon: const Icon(
                Icons.clear,
                color: ColorTheme.dark1,
                size: 20,
              ),
              onPressed: () {
                _searchController.clear();
                modelCategory.clearSearch();
              },
            ),
          ],
        ),
        body: modelCategory.listSearch.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No results for "${_searchController.text}"',
                      style: ThemeText.bodyR14.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: GridView.builder(
                    itemCount: modelCategory.listSearch.length,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final item = modelCategory.listSearch[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailMenuScreen(item),
                            ),
                          );
                        },
                        child: CardProduct(
                          imageProduct: item.images,
                          nameProduct: item.name,
                          city: item.city,
                          price: item.price,
                          kalori: item.calorie,
                        ),
                      );
                    },
                  ),
                ),
              ));
  }
}
