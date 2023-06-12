import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  Future<void> _selectTime(BuildContext context, TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedStartTime ?? TimeOfDay.now(),
      useRootNavigator: false,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (picked != null && picked != controller.text) {
      setState(() {
        controller.text = picked.format(context);
        if (controller == startTimeController) {
          selectedStartTime = picked;
        } else if (controller == endTimeController) {
          selectedEndTime = picked;
        }
      });
    }
  }

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
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: EdgeInsets.all(16),
        child: SizedBox(
          height: 500,
          width: 428,
          child: Column(
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
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Phone',

                      ),
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
                ),
                readOnly: true,
                controller: TextEditingController(
                  // text: selectedDate != null
                  //     ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                  //     :'',
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onTap: (){
                        _selectTime(context, startTimeController);
                      },
                      decoration: InputDecoration(
                        labelText: 'Start',

                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      onTap: (){
                        _selectTime(context, endTimeController);
                      },
                      decoration: InputDecoration(
                        labelText: 'End',

                      ),
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
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Number of peoples',

                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Aksi saat tombol Submit ditekan
                  },
                  child: Text('Submit',
                  style: GoogleFonts.poppins()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
