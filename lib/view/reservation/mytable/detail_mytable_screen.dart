import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nusameals/view/component/costum_snackbar.dart';
import 'package:nusameals/view/reservation/mytable/edit_mytable_screen.dart';


import '../../../themes/constant.dart';



class DetailMyTable extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String position;
  final String location;
  final String seats;
  final String name;
  final String phone;
  final String date;
  final String timeIn;
  final String timeOut;
  final String agenda;
  final int numofpeo;

  DetailMyTable({
    required this.imageUrl,
    required this.title,
    required this.position,
    required this.location,
    required this.seats,
    required this.date,
    required this.timeIn,
    required this.timeOut, required this.agenda, required this.name, required this.phone, required this.numofpeo,
  });
  @override
  State<DetailMyTable> createState() => _DetailMyTableState();
}

class _DetailMyTableState extends State<DetailMyTable> {

  int index = 0;



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
                        color: ColorTheme.light1,
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
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('\u2022 ${widget.seats}', style: GoogleFonts.poppins()),
                    Text('\u2022 ${widget.position}', style: GoogleFonts.poppins()),
                    Text('\u2022 ${widget.location}',
                        style: GoogleFonts.poppins()),
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
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20))),
                              builder: (context) => EditMyTable(
                                name: widget.name,
                                phone: widget.phone,
                                date: widget.date,
                                start: widget.timeIn,
                                end: widget.timeOut,
                                agenda: widget.agenda,
                                people: widget.numofpeo.toString(),
                              ),
                            );
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
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Text(
                                        'Name\nNumber Phone\nDate\nStart-End\nAgenda\nNumber of people',
                                        style:
                                            GoogleFonts.poppins(fontSize: 14)),
                                  ),
                                ),
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
                                Expanded(
                                  // Apply an Expanded widget here
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          widget.name,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          widget.phone,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          widget.date,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          widget.timeIn +
                                              "-" +
                                              widget.timeOut,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          widget.agenda,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          widget.numofpeo.toString(),
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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
            Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                width: 370,
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                      builder: (context) => Canceled(),
                    );
                  },
                  child: Text('Canceled Reservation',
                      style: GoogleFonts.poppins(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.red),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Canceled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 16),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Confirmation',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Do you want to cancel the reservation?',
                style: ThemeText.bodyR18,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  // width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                    child: Text(
                      'No',
                      style: GoogleFonts.poppins(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  // width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      CustomSnackbar.showSnackbar(context,
                          'Reservation has been canceled. Please wait....',
                          actionText: '');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: ColorTheme.secondaryDanger,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Yes',
                      style: GoogleFonts.poppins(
                        color: ColorTheme.light1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
