import 'package:flutter/material.dart';
import 'package:nusameals/view/reservation/detail_mytable_screen.dart';
import 'package:nusameals/view/reservation/detail_reservation_screen.dart';
import 'package:google_fonts/google_fonts.dart';


class Seat {
  final String title;
  final String status;
  final String subtitle;
  final String imageUrl;

  Seat({required this.title, required this.status, required this.imageUrl,required this.subtitle});
}
class ReservationPage extends StatefulWidget {
  const ReservationPage({Key? key}) : super(key: key);

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  final List<Seat> seats = [
    Seat(
      title: 'Table 1',
      status: 'Available',
      subtitle: 'indoors - 10 seats',
      imageUrl: 'https://plus.unsplash.com/premium_photo-1671013032391-e6cff46babe5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2071&q=80',
    ),
    Seat(
      title: 'Table 2',
      status: 'Not Available',
      subtitle: 'indoors - 8 seats',
      imageUrl: 'https://plus.unsplash.com/premium_photo-1671013032391-e6cff46babe5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2071&q=80',
    ),
    // Tambahkan entri Seat lainnya di sini
  ];
  int _currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF0669BD),
          title: Text('Reservation',
              style: GoogleFonts.poppins(color: Colors.white)),
        ),
        body: Column(
          children: [
            Container(
              color: Color(0xFF0669BD),
              child: TabBar(
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
                tabs: [
                  Tab(
                    child: Text(
                      'Table List',
                      style: GoogleFonts.poppins(
                          color: _currentTabIndex == 0 ? Colors.white : Colors.white.withOpacity(0.6),
                          fontWeight: _currentTabIndex == 0 ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'My Table',
                      style: GoogleFonts.poppins(
                        color: _currentTabIndex == 1 ? Colors.white : Colors.white.withOpacity(0.6),
                        fontWeight: _currentTabIndex == 1 ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ],
                onTap: (index){
                  setState(() {
                    _currentTabIndex = index;
                  });
                },
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                    itemCount: seats.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailReservation(
                                    imageUrl: seats[index].imageUrl,
                                    title: seats[index].title),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                )
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Container(
                                height: 100,
                                width: 70,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(14),bottomLeft: Radius.circular(14)),
                                    child: Image.network(seats[index].imageUrl,
                                      fit: BoxFit.cover,
                                    )
                                ),
                              ),
                              title: Row(
                                children: [
                                  Text(seats[index].title,
                                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
                                ],
                              ),
                              subtitle: Text(seats[index].subtitle,
                              style: GoogleFonts.poppins(),),
                              trailing: Text(seats[index].status,
                              style: GoogleFonts.poppins(),),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                    itemCount: seats.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailMyTable(
                                    imageUrl: seats[index].imageUrl,
                                    title: seats[index].title),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              )
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: ClipRRect(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(14),bottomLeft: Radius.circular(14)),
                                  child: Image.network(seats[index].imageUrl,
                                    fit: BoxFit.cover,
                                  )
                              ),
                              title: Text(seats[index].title,
                                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
                              subtitle: Text(seats[index].subtitle,
                                style: GoogleFonts.poppins(),),
                              trailing: Text(seats[index].status,
                                style: GoogleFonts.poppins(),),
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
    );
  }
}
