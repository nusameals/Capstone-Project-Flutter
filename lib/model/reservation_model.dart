class ReservationModel {
  final int idReservation;
  final int numberOfTable;
  final int seat;
  final String position;
  final String status;
  final String location;
  final String photos;
  final String idTable;

  ReservationModel({
    required this.idReservation,
    required this.numberOfTable,
    required this.seat,
    required this.position,
    required this.status,
    required this.location,
    required this.photos,
    required this.idTable,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      idReservation: json['id_reservation'],
      numberOfTable: json['number_of_table'],
      seat: json['seat'],
      position: json['position'],
      status: json['status'],
      location: json['location'],
      photos: json['photos'],
      idTable: json['id_table'],
    );
  }
}
