// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'dummy.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
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
                child: const TabBar(
                  indicatorColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
                  tabs: [
                    Tab(
                      child: Text(
                        'Ordered',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Processed',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Finished',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView.builder(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      itemCount: orderedList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Card(
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(14),
                                    bottomLeft: Radius.circular(14)),
                                child: Image.network(
                                  orderedList[index].imageUrl,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                orderedList[index].id,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(orderedList[index].dateTime),
                              trailing: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(orderedList[index].price),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      itemCount: processedList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Card(
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(14),
                                    bottomLeft: Radius.circular(14)),
                                child: Image.network(
                                  processedList[index].imageUrl,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                processedList[index].id,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(processedList[index].dateTime),
                              trailing: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(processedList[index].price),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      itemCount: orderedList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Card(
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(14),
                                    bottomLeft: Radius.circular(14)),
                                child: Image.network(
                                  orderedList[index].imageUrl,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                orderedList[index].id,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(orderedList[index].dateTime),
                              trailing: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(orderedList[index].price),
                              ),
                            ),
                          ),
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
}
