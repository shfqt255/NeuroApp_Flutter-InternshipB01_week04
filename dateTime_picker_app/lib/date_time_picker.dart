import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Appointmentpage extends StatefulWidget {
  const Appointmentpage({super.key});

  @override
  State<Appointmentpage> createState() => AppointmentpageState();
}

class AppointmentpageState extends State<Appointmentpage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> pickTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  int? remainingDaysCalculation() {
    if (selectedDate == null) return null;
    DateTime today = DateTime.now();
    DateTime dateOnlyToday = DateTime(
      today.year,
      today.month,
      today.day,
    ); // remove time, so days can calculate properly.
    return selectedDate!.difference(dateOnlyToday).inDays;
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = selectedDate == null
        ? 'Select Date'
        : DateFormat('dd-MM-yyyy').format(selectedDate!);

    String formattedTime = selectedTime == null
        ? 'Select Time'
        : selectedTime!.format(context);

    int? remainingDays = remainingDaysCalculation();

    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Booking'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          DropdownButton(
            iconSize: 20,
            iconEnabledColor: Colors.white,
            iconDisabledColor: Colors.white,
            items: [
              DropdownMenuItem(value: 'date', child: Text('Pick Date')),
              DropdownMenuItem(value: 'time', child: Text('Pick Time')),
            ],
            onChanged: (value) {
              if (value == 'date') {
                pickDate();
              } else if (value == 'time') {
                pickTime();
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.deepPurple,

                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      'Selected Date&Time',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          'Date: ${formattedDate} ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Time: ${formattedTime}',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Days Remaining to appointment: ${remainingDays} days',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
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
