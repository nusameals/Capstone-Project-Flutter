import 'package:flutter/material.dart';
import 'package:nusameals/view/reservation/detail_reservation_screen.dart';


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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0669BD),
          title: Text('Reservation',style: TextStyle(color: Colors.white)),
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
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Table List',
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
                                builder: (context) => DetailReservation(imageUrl: seats[index].imageUrl),
                              ),
                            );
                          },
                          child: Card(
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: ClipRRect(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(14),bottomLeft: Radius.circular(14)),
                                  child: Image.network(seats[index].imageUrl,
                                    fit: BoxFit.cover,
                                  )
                              ),
                              title: Text(seats[index].title,
                                style: TextStyle(fontWeight: FontWeight.bold),),
                              subtitle: Text(seats[index].subtitle),
                              trailing: Text(seats[index].status),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: seats.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          leading: Image.network(seats[index].imageUrl),
                          title: Text(seats[index].title),
                          subtitle: Text(seats[index].subtitle),
                          trailing: Text(seats[index].status),
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
