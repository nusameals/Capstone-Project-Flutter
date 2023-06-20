import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../themes/constant.dart';

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
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController agendaController = TextEditingController();
  TextEditingController numberOfPeopleController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
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
        }
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        dateController.text = DateFormat('dd/MM/yyyy').format(selectedDate!);
      });
    }
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
                  primary: ColorTheme.primaryBlue80,
                  secondary: Colors.blue,
                ),
            scaffoldBackgroundColor: Colors.white,
            textTheme: Theme.of(context).textTheme.copyWith(
                  bodyText1: const TextStyle(color: ColorTheme.dark1),
                ),
            timePickerTheme: TimePickerThemeData(
              hourMinuteTextColor: ColorTheme.dark1,
              dayPeriodTextColor: ColorTheme.dark1,
              dayPeriodTextStyle: TextStyle(color: ColorTheme.dark1),
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
                      cursorColor: Colors.blue,
                      controller: nameController,
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
                      cursorColor: Colors.blue,
                      controller: phoneController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              TextFormField(
                onTap: () {
                  _selectDate(context);
                },
                decoration: InputDecoration(
                  labelText: 'date',
                  suffixIcon: const Icon(Icons.calendar_month),
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
                      readOnly: true,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      onTap: () {
                        _selectTime(context, endTimeController);
                      },
                      decoration: const InputDecoration(
                          labelText: 'End',
                          suffixIcon: Icon(Icons.access_time)),
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
                          color: Colors.black.withOpacity(0.7),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      cursorColor: Colors.blue,
                      controller: agendaController,
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
                      cursorColor: Colors.blue,
                      controller: numberOfPeopleController,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final String name = nameController.text;
                    final String phone = phoneController.text;
                    DateTime? date;
                    try {
                      date = DateFormat('dd/MM/yyyy').parse(dateController.text);
                    } catch (e) {
                      print('Invalid date format: ${dateController.text}');
                    }
                    final String startTime = startTimeController.text;
                    final String endTime = endTimeController.text;
                    final String agenda = agendaController.text;
                    final String numofpeop = numberOfPeopleController.text;
                    if (date != null) {
                      // final addReservation newReservation = addReservation(
                      //   name: name,
                      //   phone: phone,
                      //   date: date,
                      //   startTime: startTime,
                      //   endTime: endTime,
                      //   agenda: agenda,
                      //   numofpeop: numofpeop,
                      // );
                      // provider

                      Navigator.pop(context);
                    } else {
                      // Handle invalid date format error
                      // Show an error message or perform any necessary actions
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorTheme.primaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
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
