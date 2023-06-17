import 'package:flutter/material.dart';
import 'package:nusameals/view/reservation/mytable/detail_mytable_screen.dart';
import 'package:nusameals/view/reservation/tablelist/detail_reservation_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nusameals/view_model/reservation_view_model.dart';
import 'package:provider/provider.dart';

import '../../themes/constant.dart';



class ReservationPage extends StatefulWidget {
  const ReservationPage({Key? key}) : super(key: key);

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {

  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    // Fetch reservations when the view is loaded
    Provider.of<ReservationViewModel>(context, listen: false).fetchReservations();
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorTheme.primaryBlue,
          title: Text('Reservation',
              style: GoogleFonts.poppins(color: Colors.white)),
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
              color: ColorTheme.primaryBlue,
              child: TabBar(
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
                tabs: [
                  Tab(
                    child: Text(
                      'Table List',
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
                      'My Table',
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
                  Consumer<ReservationViewModel>(
                    builder: (context, viewModel, child) {
                      if (viewModel.isLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (viewModel.errorMessage.isNotEmpty) {
                        return Center(
                          child: Text(viewModel.errorMessage),
                        );
                      } else {
                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          itemCount: viewModel.reservations.length,
                          itemBuilder: (BuildContext context, int index) {
                            var reservation = viewModel.reservations[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: GestureDetector(
                                onTap: () {
                                  if (reservation.status != 'Not Available') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailReservation(
                                          imageUrl: reservation.photos,
                                          title: 'Table ${reservation.numberOfTable}',
                                          position: reservation.position,
                                          location: reservation.location,
                                          seats: '${reservation.seat} seats',
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: ColorTheme.light1,
                                    border: Border.all(
                                      color: ColorTheme.dark5,
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(14),
                                            bottomLeft: Radius.circular(14),
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(reservation.photos),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Table ${reservation.numberOfTable}',
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                '${reservation.position} - ${reservation.seat} seats',
                                                style: GoogleFonts.poppins(fontSize: 13),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              reservation.status,
                                              style: GoogleFonts.poppins(
                                                color: reservation.status == 'Available'
                                                    ? ColorTheme.dark1
                                                    : ColorTheme.secondaryDanger,
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
                        );
                      }
                    },
                  ),
                  ListView(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailMyTable(
                                  imageUrl: 'https://img.okezone.com/content/2022/02/11/298/2545904/10-restoran-fine-dining-di-jakarta-pas-untuk-ajak-rekan-bisnis-0cI8wSysW4.jpg',
                                  title: 'Table 1',
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorTheme.light1,
                              border: Border.all(
                                color: ColorTheme.dark5,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(14),
                                      bottomLeft: Radius.circular(14),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage('https://img.okezone.com/content/2022/02/11/298/2545904/10-restoran-fine-dining-di-jakarta-pas-untuk-ajak-rekan-bisnis-0cI8wSysW4.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Table 1',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          'Indoors - 10 seats',
                                          style: GoogleFonts.poppins(fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '17/08/2023',
                                            style: GoogleFonts.poppins(),
                                          ),
                                          Text(
                                            '20:00-21:00',
                                            style: GoogleFonts.poppins(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Tambahkan item teks lainnya di sini
                    ],
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
