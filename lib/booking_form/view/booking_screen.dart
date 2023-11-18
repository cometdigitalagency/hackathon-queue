import 'package:flutter/material.dart';
import 'package:hackaton_2023/booking_form/booking_form.dart';
import 'package:hackaton_2023/booking_form/view/advice_booking_passport.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key, required this.formId});
  final int formId;
  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  var readAlready = false;
  @override
  Widget build(BuildContext context) {
    return !readAlready
        ? AdviceBookPassport(
            acceptRead: () {
              setState(() {
                readAlready = true;
              });
            },
          )
        : BookingForm(formId: widget.formId);
  }
}
