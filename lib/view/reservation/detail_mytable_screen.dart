import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailMyTable extends StatefulWidget {
  final String imageUrl;
  final String title;

  const DetailMyTable({ required this.imageUrl, required this.title}) ;

  @override
  State<DetailMyTable> createState() => _DetailMyTableState();
}

class _DetailMyTableState extends State<DetailMyTable> {
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
          SizedBox(height: 12),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('\u2022 10 seats', style: GoogleFonts.poppins()),
                  Text('\u2022 indoors', style: GoogleFonts.poppins()),
                  Text('\u2022 in the middle of the room', style: GoogleFonts.poppins()),
                  Divider(
                    color: Colors.blue,
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Reservation Detail',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          // Aksi yang ingin Anda lakukan saat ikon diklik
                        },
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.blue,
                          ),
                          child: Icon(
                            Icons.edit_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name\nNumber Phone\nDate\nStart-End\nAgenda\nNumber of people',
                              style: GoogleFonts.poppins(fontSize: 14)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          height: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Trina Davis',
                                  style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.bold)),
                              Text('+62 8123456789',
                              style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.bold)),
                              Text('17/08/2023',
                              style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.bold)),
                              Text('20:00-21:00',
                              style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.bold)),
                              Text('Dinner',
                              style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.bold)),
                              Text('10',
                              style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),


          Spacer(),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
              width: 370,
              child: ElevatedButton(
                onPressed: () {

                },
                child: Text('Canceled Reservation',style: GoogleFonts.poppins(color: Colors.red,fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.red),
                  backgroundColor: Colors.white,
                ),

              ),
            ),
          ),
        ],
      ),
    );
  }
}
