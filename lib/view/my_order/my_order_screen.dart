// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../component/card_my_order.dart';
import 'dummy.dart';
import 'orders_details.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  int _currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0669BD),
        title: Text('My Orders', style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Container(
                color: Color(0xFF0669BD),
                child: TabBar(
                  indicatorColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
                  tabs: [
                    Tab(
                      child: Text(
                        'Ordered',
                        style: GoogleFonts.poppins(
                          color: _currentTabIndex == 0
                              ? Colors.white
                              : Colors.white.withOpacity(0.6),
                          fontWeight: _currentTabIndex == 0
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Processed',
                        style: GoogleFonts.poppins(
                          color: _currentTabIndex == 1
                              ? Colors.white
                              : Colors.white.withOpacity(0.6),
                          fontWeight: _currentTabIndex == 1
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Finished',
                        style: GoogleFonts.poppins(
                          color: _currentTabIndex == 2
                              ? Colors.white
                              : Colors.white.withOpacity(0.6),
                          fontWeight: _currentTabIndex == 2
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                  onTap: (index) {
                    setState(() {
                      _currentTabIndex = index;
                    });
                  },
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    orderedList.isEmpty
                        ? _listIsEmpty()
                        : ListView.builder(
                            itemCount: orderedList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const OrderDetailScreen()));
                                  },
                                  child: CardMyOrder(
                                      id: orderedList[index].id,
                                      dateTime: orderedList[index].dateTime,
                                      price: orderedList[index].price,
                                      imageUrl: orderedList[index].imageUrl),
                                ),
                              );
                            },
                          ),
                    processedList.isEmpty
                        ? _listIsEmpty()
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                            itemCount: processedList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const OrderDetailScreen()));
                                },
                                child: CardMyOrder(
                                    id: processedList[index].id,
                                    dateTime: processedList[index].dateTime,
                                    price: processedList[index].price,
                                    imageUrl: processedList[index].imageUrl),
                              );
                            },
                          ),
                    finishedList.isEmpty
                        ? _listIsEmpty()
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            itemCount: finishedList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {},
                                child: CardMyOrder(
                                    id: finishedList[index].id,
                                    dateTime: finishedList[index].dateTime,
                                    price: finishedList[index].price,
                                    imageUrl: finishedList[index].imageUrl),
                              );
                            },
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listIsEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.restaurant,
            color: Colors.grey,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'You have not ordered anything yet',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
