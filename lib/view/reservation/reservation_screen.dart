import 'package:flutter/material.dart';
import 'package:nusameals/view/reservation/mytable/detail_mytable_screen.dart';
import 'package:nusameals/view/reservation/tablelist/detail_reservation_screen.dart';
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
      status: 'Not Available',
      subtitle: 'indoors - 10 seats',
      imageUrl: 'https://img.okezone.com/content/2022/02/11/298/2545904/10-restoran-fine-dining-di-jakarta-pas-untuk-ajak-rekan-bisnis-0cI8wSysW4.jpg',
    ),
    Seat(
      title: 'Table 2',
      status: 'Available',
      subtitle: 'indoors - 8 seats',
      imageUrl: 'https://img.okezone.com/content/2022/02/11/298/2545904/10-restoran-fine-dining-di-jakarta-pas-untuk-ajak-rekan-bisnis-0cI8wSysW4.jpg',
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
          elevation: 0,
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
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    itemCount: seats.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: GestureDetector(
                          onTap: () {
                            if (seats[index].status != 'Not Available') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailReservation(
                                    imageUrl: seats[index].imageUrl,
                                    title: seats[index].title,
                                  ),
                                ),
                              );
                            }
                          },

                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(14),
                                      bottomLeft: Radius.circular(14),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(seats[index].imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          seats[index].title,
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 2,),
                                        Text(
                                          seats[index].subtitle,
                                          style: GoogleFonts.poppins(fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          seats[index].status,
                                          style: GoogleFonts.poppins(
                                            color: seats[index].status == 'Available' ? Colors.black : Colors.red, // Ubah warna teks berdasarkan status

                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    itemCount: seats.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailMyTable(
                                  imageUrl: seats[index].imageUrl,
                                  title: seats[index].title,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(14),
                                      bottomLeft: Radius.circular(14),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(seats[index].imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          seats[index].title,
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 2,),
                                        Text(
                                          seats[index].subtitle,
                                          style: GoogleFonts.poppins(fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('17/08/2023',
                                            style: GoogleFonts.poppins(),),
                                            Text('20:00-21:00',
                                                style: GoogleFonts.poppins())
                                          ],
                                        )
                                      ),
                                    ),
                                  ),
                                ),

                              ],
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
