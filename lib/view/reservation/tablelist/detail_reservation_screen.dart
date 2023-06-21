import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nusameals/view/reservation/tablelist/reservationnow.dart';

import '../../../themes/constant.dart';

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
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.network(
                    widget.imageUrl,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
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
                          color: Colors.black.withOpacity(0.5)),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.title,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\u2022 10 seats',
                      style: GoogleFonts.poppins(),
                    ),
                    Text(
                      '\u2022 indoors',
                      style: GoogleFonts.poppins(),
                    ),
                    Text(
                      '\u2022 in the middle of the room',
                      style: GoogleFonts.poppins(),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 370,
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                      builder: (context) => const ReservationNow(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorTheme.primaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text('Reservasi Now',
                      style: GoogleFonts.poppins(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
