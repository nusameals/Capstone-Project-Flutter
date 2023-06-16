// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nusameals/view/menu/menu_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../themes/constant.dart';
import 'cart/cart_screen.dart';
import 'home/home_screen.dart';
import 'home/notification_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  int index = 0;
  late TabController _tabController;
  late SharedPreferences loginData;
  // ignore: non_constant_identifier_names
  String Username = '';

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      Username = loginData.getString('username').toString();
    });
  }

  final List<Tab> menuTabs = <Tab>[
    Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorTheme.primaryBlue20, width: 1),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "For You",
            style: ThemeText.bodyR12,
          ),
        ),
      ),
    ),
    Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorTheme.primaryBlue20, width: 1),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "Low Calories",
            textAlign: TextAlign.center,
            style: ThemeText.bodyR12,
          ),
        ),
      ),
    ),
    Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorTheme.primaryBlue20, width: 1),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "Saving Package",
            textAlign: TextAlign.center,
            style: ThemeText.bodyR12,
          ),
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: menuTabs.length, vsync: this);
    initial();
  }

  onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> listScreen = <Widget>[
      HomeScreen(
        onPressedSpecialForYou: () {
          setState(() {
            _selectedIndex = 1;
            _tabController.animateTo(0);
          });
        },
        onPressedLowCalories: () {
          setState(() {
            _selectedIndex = 1;
            _tabController.animateTo(1);
          });
        },
        onPressedSavingPackages: () {
          setState(() {
            _selectedIndex = 1;
            _tabController.animateTo(2);
          });
        },
      ),
      MenuScreen(tabController: _tabController),
      const HomeScreen(), //  MyOrderScreen()
      const HomeScreen(), //  ReservationScreen()
    ];
    return Theme(
      data: Theme.of(context).copyWith(useMaterial3: false),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: _selectedIndex == 0
              ? 60
              : _selectedIndex == 1
                  ? 90
                  : null,
          backgroundColor: _selectedIndex == 0
              ? ColorTheme.primaryBlue
              : _selectedIndex == 1
                  ? Colors.white
                  : ColorTheme.primaryBlue,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: _selectedIndex == 0
              ? Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                      icon: const Icon(
                        Icons.account_circle_outlined,
                        size: 30,
                      )),
                )
              : null,
          title: _selectedIndex == 0
              ? Text(
                  Username,
                  style: ThemeText.subHeadingB18Light,
                )
              : _selectedIndex == 1
                  ? InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/search');
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        // margin: const EdgeInsets.only(left: 5),
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: ColorTheme.light4,
                        ),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.search,
                              color: ColorTheme.dark1,
                              size: 18,
                            ),
                            hintText: "Search",
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: ColorTheme.dark1,
                            ),
                          ),
                          style: ThemeText.bodyR16,
                        ),
                      ),
                    )
                  : null,
          actions: _selectedIndex == 0
              ? [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: IconButton(
                      icon: const Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Notifications()));
                      },
                    ),
                  )
                ]
              : _selectedIndex == 1
                  ? [
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CartScreen()));
                          },
                          icon: const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                    ]
                  : [],
          bottom: _selectedIndex == 1
              ? TabBar(
                  dividerColor: ColorTheme.primaryBlue,
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                  unselectedLabelColor: ColorTheme.dark1,
                  labelColor: ColorTheme.dark1,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorTheme.primaryBlue20,
                  ),
                  controller: _tabController,
                  tabs: menuTabs,
                )
              : null,
        ),
        body: _selectedIndex == 1
            ? MenuScreen(tabController: _tabController)
            : listScreen.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 3,
          backgroundColor: ColorTheme.light3,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.restaurant,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: onTapItem,
          selectedItemColor: ColorTheme.primaryBlue,
          unselectedItemColor: ColorTheme.dark5,
        ),
      ),
    );
  }
}
