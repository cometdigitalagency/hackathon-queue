import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FalseBookingScreen extends StatelessWidget {
  const FalseBookingScreen({super.key, required this.msg});
  final String? msg;
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
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.red),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "ລາຍການຖືກປະຕິເສດ!",
                    style: TextStyle(fontSize: 28),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    msg != null ? msg! : "ມີບາງຢ່າງຜົດພາດ",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.go('/');
                },
                child: const Text("ກັບໜ້າຫຼັກ"),
              ),
            )
          ],
        ),
      )),
    );
  }
}
