import 'package:flutter/material.dart';

class DetailReservation extends StatefulWidget {
  final String imageUrl;

  const DetailReservation({required this.imageUrl});

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
                top: 16,
                left: 16,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ),
            ],
          ),
          Text('data'),
          Spacer(),
          Divider(),
          Container(
            width: 370,
            child: ElevatedButton(
              onPressed: () {
                // Tambahkan logika aksi yang ingin Anda lakukan saat tombol ditekan
              },
              child: Text('Reservasi Now',style: TextStyle(color: Colors.white)),
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
