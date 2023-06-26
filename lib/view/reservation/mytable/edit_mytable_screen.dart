import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../themes/constant.dart';

class EditMyTable extends StatefulWidget {
  String name;
  String phone;
  String date;
  String start;
  String end;
  String agenda;
  String people;
  EditMyTable({
    Key? key,
    required this.name,
    required this.phone,
    required this.date,
    required this.start,
    required this.end,
    required this.agenda,
    required this.people,
  }) : super(key: key);

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

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        builder: (BuildContext context, Widget? child) {
          return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: Theme.of(context).colorScheme.copyWith(
                      primary: ColorTheme.primaryBlue80,
                      secondary: Colors.blue,
                    ),
              ),
              child: child!);
        });

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        controller.text = DateFormat('dd/MM/yyyy').format(selectedDate!);
        widget.date = controller.text;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    selectedStartTime = TimeOfDay(
        hour: int.parse(widget.start.split(':')[0]),
        minute: int.parse(widget.start.split(':')[1]));
    selectedEndTime = TimeOfDay(
        hour: int.parse(widget.end.split(':')[0]),
        minute: int.parse(widget.end.split(':')[1]));
    selectedDate = DateFormat('dd/MM/yyyy').parse(widget.date);
    startTimeController.text = widget.start;
    endTimeController.text = widget.end;
    dateController.text = widget.date;
  }

  Future<void> _selectTime(
      BuildContext context, TextEditingController controller) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: Colors.blue,
                  secondary: Colors.blue,
                ),
            scaffoldBackgroundColor: Colors.white,
            textTheme: Theme.of(context).textTheme.copyWith(
                  // ignore: deprecated_member_use
                  bodyText1: const TextStyle(color: Colors.black),
                ),
            timePickerTheme: const TimePickerThemeData(
              hourMinuteTextColor: Colors.black,
              dayPeriodTextColor: Colors.black,
              dayPeriodTextStyle: TextStyle(color: Colors.black),
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
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.all(16),
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
                        color: Colors.black.withOpacity(0.7),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    initialValue: widget.name,
                    onChanged: (value) {
                      setState(() {
                        widget.name = value;
                      });
                    },
                    cursorColor: Colors.blue,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Phone',
                      labelStyle: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    initialValue: widget.phone,
                    onChanged: (value) {
                      setState(() {
                        widget.phone = value;
                      });
                    },
                    cursorColor: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            TextFormField(
              onTap: () {
                _selectDate(context, dateController);
              },
              decoration: InputDecoration(
                labelText: 'date',
                suffixIcon: const Icon(
                  Icons.calendar_month,
                ),
                labelStyle: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              controller: dateController,
              onChanged: (value) {
                setState(() {
                  widget.date = value;
                });
              },
              cursorColor: Colors.blue,
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
                      suffixIcon: const Icon(Icons.access_time),
                      labelStyle: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    controller: startTimeController,
                    onChanged: (value) {
                      setState(() {
                        widget.start = value;
                      });
                    },
                    cursorColor: Colors.blue,
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
                      suffixIcon: const Icon(Icons.access_time),
                      labelStyle: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    controller: endTimeController,
                    onChanged: (value) {
                      setState(() {
                        widget.end = value;
                      });
                    },
                    cursorColor: Colors.blue,
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
                        color: Colors.black.withOpacity(0.7),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    initialValue: widget.agenda,
                    onChanged: (value) {
                      setState(() {
                        widget.agenda = value;
                      });
                    },
                    cursorColor: Colors.blue,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Number of peoples',
                      labelStyle: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    initialValue: widget.people,
                    onChanged: (value) {
                      setState(() {
                        widget.people = value;
                      });
                    },
                    cursorColor: Colors.blue,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  // ignore: deprecated_member_use
                  primary: ColorTheme.primaryBlue,
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
