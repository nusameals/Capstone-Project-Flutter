import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nusameals/view/reservation/edit_mytable_screen.dart';


class Table {
  final String name;
  final String phone;
  final String date;
  final String start;
  final String end;
  final String agenda;
  final String people;

  Table(
      {required this.name,
      required this.phone,
      required this.date,
      required this.start,
        required this.end,
      required this.agenda,
      required this.people});
}
class DetailMyTable extends StatefulWidget {
  final String imageUrl;
  final String title;

  const DetailMyTable({ required this.imageUrl, required this.title}) ;

  @override
  State<DetailMyTable> createState() => _DetailMyTableState();
}

class _DetailMyTableState extends State<DetailMyTable> {
  final List<Table> tables = [
    Table(
    name: 'Trina Davis',
      phone: '+62 8123456789',
      date: '17/08/2023',
      start: '20:00',
      end: '21:00',
      agenda: 'Dinner',
      people: '10',


    )
    // Tambahkan entri Seat lainnya di sini
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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

                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20)
                                  )
                              ),
                              builder: (context) => EditMyTable(
                                name: tables[index].name,
                                phone: tables[index].phone,
                                date: tables[index].date,
                                start: tables[index].start,
                                end: tables[index].end,
                                agenda: tables[index].agenda,
                                people: tables[index].people,
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
                              Text(tables[index].name,
                                  style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.bold)),
                              Text(tables[index].phone,
                              style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.bold)),
                              Text(tables[index].date,
                              style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.bold)),
                              Text(tables[index].start + "-" + tables[index].end,
                              style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.bold)),
                              Text(tables[index].agenda,
                              style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.bold)),
                              Text(tables[index].people,
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
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20)
                      )
                    ),
                    builder: (context) => Canceled(),
                  );
                },

                child: Text('Canceled Reservation',style: GoogleFonts.poppins(color: Colors.red,fontWeight: FontWeight.bold)),
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
    );
  }
}

class Canceled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15)
        ),
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
                style: GoogleFonts.poppins(fontSize: 15),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150, // Adjust the width as per your requirement
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your action for "Yes" button
                      Navigator.pop(context); // Close the modal when the button is pressed
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // Replace with your desired button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                    child: Text(
                      'No',
                      style: GoogleFonts.poppins(
                        color: Colors.blue, // Replace with your desired text color
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 150, // Adjust the width as per your requirement
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your action for "No" button
                      Navigator.pop(context); // Close the modal when the button is pressed
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // Replace with your desired button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Yes',
                      style: GoogleFonts.poppins(
                        color: Colors.white, // Replace with your desired text color
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
