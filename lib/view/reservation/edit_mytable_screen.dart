import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EditMyTable extends StatefulWidget {
  String name;
   String phone;
   String date;
  String start;
  String end;
   String agenda;
   String people;
   EditMyTable({Key? key, required this.name, required this.phone, required this.date, required this.start,required this.end, required this.agenda, required this.people, }) : super(key: key);

  @override

  State<EditMyTable> createState() => _EditMyTableState();
}

class _EditMyTableState extends State<EditMyTable> {
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;
  DateTime? selectedDate;

  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController dateController = TextEditingController();


  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(primary: Colors.blue),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        controller.text = DateFormat('dd/MM/yyyy').format(selectedDate!);
      });
    }
  }

  Future<void> _selectTime(BuildContext context, TextEditingController controller) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
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
    return Padding(
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
                    // Aksi saat tombol kembali ditekan
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
                    ),
                    initialValue: widget.name,
                    onChanged: (value) {
                      setState(() {
                        widget.name = value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Phone',
                    ),
                    initialValue: widget.phone,
                    onChanged: (value) {
                      setState(() {
                        widget.phone = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            TextFormField(
              onTap: (){
                _selectDate(context, dateController);
              },
              decoration: InputDecoration(
                  labelText: 'date',
                  suffixIcon: Icon(Icons.calendar_month)
              ),
             controller: TextEditingController(text: widget.date),
              onChanged: (value) {
                setState(() {
                  widget.date = value;
                });
              },
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
                        suffixIcon: Icon(Icons.access_time)
                    ),
                    controller: TextEditingController(text: widget.start),
                    onChanged: (value) {
                      setState(() {
                        widget.start = value;
                      });
                    },
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
                    controller: TextEditingController(text: widget.end),
                    onChanged: (value) {
                      setState(() {
                        widget.end = value;
                      });
                    },
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
                    ),
                    initialValue: widget.agenda,
                    onChanged: (value) {
                      setState(() {
                        widget.agenda = value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Number of peoples',
                    ),
                    initialValue: widget.people,
                    onChanged: (value) {
                      setState(() {
                        widget.people = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Aksi saat tombol Submit ditekan
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF0669BD), // Ubah warna latar belakang menjadi biru
                ),
                child: Text('Submit',
                    style: GoogleFonts.poppins(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
