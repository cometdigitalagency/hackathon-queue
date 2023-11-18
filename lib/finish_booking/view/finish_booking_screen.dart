import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FinishBookingScreen extends StatelessWidget {
  const FinishBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/finish_submit_form.png'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "ການສົ່ງຟອມສຳເລັດ",
                    style: TextStyle(fontSize: 28),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("ກະລຸນາລໍຖ້າການອະນຸມັດ."),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.go('/history');
                },
                child: const Text("ເບິ່ງປະຫວັດການຈອງຄິວ"),
              ),
            )
          ],
        ),
      )),
    );
  }
}
