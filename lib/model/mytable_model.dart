class MyTable {
  final String customerName;
  final String phoneNumber;
  final String date;
  final String timeIn;
  final String timeOut;
  final String agenda;
  final int numberOfPeople;
  final String idReservation;

  MyTable({
    required this.customerName,
    required this.phoneNumber,
    required this.date,
    required this.timeIn,
    required this.timeOut,
    required this.agenda,
    required this.numberOfPeople,
    required this.idReservation,
  });

  factory MyTable.fromJson(Map<String, dynamic> json) {
    return MyTable(
      customerName: json['customer_name'],
      phoneNumber: json['phone_number'],
      date: json['date'],
      timeIn: json['time_in'],
      timeOut: json['time_out'],
      agenda: json['agenda'],
      numberOfPeople: json['number_of_people'],
      idReservation: json['id_reservation'],
    );
  }
}
