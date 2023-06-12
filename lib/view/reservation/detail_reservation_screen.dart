import 'package:flutter/material.dart';
import 'package:nusameals/view/reservation/reservationnow.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailReservation extends StatefulWidget {
  final String imageUrl;
  final String title;

  DetailReservation({required this.imageUrl, required this.title});

  @override
  _DetailReservationState createState() => _DetailReservationState();
}

class _DetailReservationState extends State<DetailReservation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.network(widget.imageUrl),
              ),
              Positioned(
                top: 24,
                left: 25,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.5)
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,

                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.title,
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(fontSize: 16,
                fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('\u2022 10 seats',
                  style: GoogleFonts.poppins(),),
                  Text('\u2022 indoors',
                    style: GoogleFonts.poppins(),),
                  Text('\u2022 in the middle of the room',
                    style: GoogleFonts.poppins(),),
                ],
              ),
            ),
          ),
          Spacer(),
          Divider(),
          Container(
            width: 370,
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => const ReservationNow(),

                );
              },
              child: Text('Reservasi Now',style: GoogleFonts.poppins(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),

            ),
          ),
        ],
      ),
    );

  }
}
