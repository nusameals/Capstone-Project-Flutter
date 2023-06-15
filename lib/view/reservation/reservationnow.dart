import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


class ReservationNow extends StatefulWidget {
  const ReservationNow({Key? key}) : super(key: key);

  @override
  State<ReservationNow> createState() => _ReservationNowState();
}

class _ReservationNowState extends State<ReservationNow> {
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;
  DateTime? selectedDate;

  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController dateController = TextEditingController();


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),

    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        dateController.text = DateFormat('dd/MM/yyyy').format(selectedDate!);
      });
    }
  }

  Future<void> _selectTime(BuildContext context, TextEditingController controller) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Colors.blue, // Mengubah warna utama menjadi biru
              secondary: Colors.blue, // Mengubah warna aksen menjadi biru
            ),
            scaffoldBackgroundColor: Colors.white, // Mengubah warna latar belakang dialog menjadi putih
            textTheme: Theme.of(context).textTheme.copyWith(
              bodyText1: TextStyle(color: Colors.black),
              // Mengubah warna teks menjadi hitam
            ),
            timePickerTheme: TimePickerThemeData(
              hourMinuteTextColor: Colors.black, // Mengubah warna aksen jam digital menjadi biru
              dayPeriodTextColor: Colors.black, // Mengubah warna aksen AM/PM menjadi biru
              dayPeriodTextStyle: TextStyle(color: Colors.black), // Mengubah warna aksen AM/PM menjadi biru
            ),
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!, 
          ),
        );
      },
    );

    if (pickedTime != null) {
      final hour = pickedTime.hour.toString().padLeft(2, '0');
      final minute = pickedTime.minute.toString().padLeft(2, '0');
      final formattedTime = '$hour:$minute';
      controller.text = formattedTime;

      if (controller == startTimeController) {
        setState(() {
          selectedStartTime = pickedTime;
        });
      } else if (controller == endTimeController) {
        setState(() {
          selectedEndTime = pickedTime;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(useMaterial3: true),
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Please fill in the following form',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nama',
                        labelStyle: TextStyle(
                          color: Colors.black.withOpacity(0.7), // Mengubah warna label teks menjadi abu-abu saat tidak aktif
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue), // Mengubah warna aksen menjadi biru
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey), // Mengubah warna tepi menjadi abu-abu saat tidak aktif
                        ),
                      ),
                      cursorColor: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Phone',
                        labelStyle: TextStyle(
                          color: Colors.black.withOpacity(0.7), // Mengubah warna label teks menjadi abu-abu saat tidak aktif
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue), // Mengubah warna aksen menjadi biru
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey), // Mengubah warna tepi menjadi abu-abu saat tidak aktif
                        ),
                      ),
                      cursorColor: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              TextFormField(
                onTap: (){
                  _selectDate(context);
                },
                decoration: InputDecoration(
                  labelText: 'date',
                  suffixIcon: Icon(Icons.calendar_month),
                  labelStyle: TextStyle(
                    color: Colors.black.withOpacity(0.7), // Mengubah warna label teks menjadi abu-abu saat tidak aktif
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue), // Mengubah warna aksen menjadi biru
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey), // Mengubah warna tepi menjadi abu-abu saat tidak aktif
                  ),
                ),
                readOnly: true,
                controller: dateController,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onTap: () {
                        _selectTime(context, startTimeController);
                      },
                      decoration: InputDecoration(
                        labelText: 'Start',
                          suffixIcon: Icon(Icons.access_time),
                        labelStyle: TextStyle(
                          color: Colors.black.withOpacity(0.7), // Mengubah warna label teks menjadi abu-abu saat tidak aktif
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue), // Mengubah warna aksen menjadi biru
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey), // Mengubah warna tepi menjadi abu-abu saat tidak aktif
                        ),
                      ),
                      controller: startTimeController,
                      readOnly: true,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      onTap: () {
                        _selectTime(context, endTimeController);
                      },
                      decoration: InputDecoration(
                        labelText: 'End',
                          suffixIcon: Icon(Icons.access_time)
                      ),
                      controller: endTimeController,
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Agenda',
                        labelStyle: TextStyle(
                          color: Colors.black.withOpacity(0.7), // Mengubah warna label teks menjadi abu-abu saat tidak aktif
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue), // Mengubah warna aksen menjadi biru
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey), // Mengubah warna tepi menjadi abu-abu saat tidak aktif
                        ),
                      ),
                      cursorColor: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Number of peoples',
                        labelStyle: TextStyle(
                          color: Colors.black.withOpacity(0.7), // Mengubah warna label teks menjadi abu-abu saat tidak aktif
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue), // Mengubah warna aksen menjadi biru
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey), // Mengubah warna tepi menjadi abu-abu saat tidak aktif
                        ),
                      ),
                      cursorColor: Colors.blue,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Aksi saat tombol Submit ditekan
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0669BD),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),// Ubah warna latar belakang menjadi biru
                  ),
                  child: Text('Submit',
                  style: GoogleFonts.poppins(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
