// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:nusameals/view/menu_test_screen.dart';

import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  int? selectedIndex;
  MainScreen({
    Key? key,
    this.selectedIndex,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 1;
  final listScreen = [
    const HomeScreen(),
    const MenuScreen(), // const MenuScreen()
    const HomeScreen(), // const MyOrderScreen()
    const HomeScreen(), // const ReservationScreen()
  ];

  onTapItem(int index) {
    if (index != 1) {
      setState(() {
        selectedIndex = index;
      });
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MainScreen(
                    selectedIndex: 1,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listScreen.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFf7f5ef),
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
        currentIndex: selectedIndex,
        onTap: onTapItem,
        selectedItemColor: Color(0xff0669BD),
        unselectedItemColor: const Color.fromARGB(255, 192, 189, 189),
      ),
    );
  }
}
