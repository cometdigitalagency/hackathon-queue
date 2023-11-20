import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginScreen> {
  final TextEditingController _phoneController =
      TextEditingController(text: '2059158789');
  var isSendOtp = false;
  var otp = '';
  late Timer _timer;
  int _countdown = 60;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          if (_countdown < 1) {
            // Countdown has reached zero, perform any actions here
            timer.cancel();
          } else {
            // Decrease the countdown value
            _countdown -= 1;
          }
        });
      },
    );
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed to prevent memory leaks
    _timer.cancel();
    super.dispose();
  }

  void onSendOTP() {
    final phone = _phoneController.value.text;
    if (phone.isNotEmpty) {
      setState(() {
        isSendOtp = true;
      });
      startTimer();
    }
  }

  void onSignIn() {
    final phone = _phoneController.value.text;
    if (phone.isNotEmpty && otp.isNotEmpty) {
      context.go('/');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Login Success!'),
          duration: const Duration(
              seconds: 3), // Duration for which the SnackBar will be visible
          action: SnackBarAction(
            label: 'Close',
            onPressed: () {
              // Perform any action when the "Close" button is pressed
              ScaffoldMessenger.of(context)
                  .hideCurrentSnackBar(); // Close the SnackBar
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 20, 28, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const Text("ຍິນດີຕ້ອນຮັບກັບຄືນ"),
                const SizedBox(height: 10),
                const Text(
                  "ເຂົ້າສູ່ລະບົບ Lao Booking",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                !isSendOtp
                    ? Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                const Text(
                                  "ກະລຸກາປ້ອນເບີໂທລະສັບ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                    "ທ່ານຈະໄດ້ຮັບລະຫັດ OTP ຜ່ານເບີໂທລະສັບຂອງທ່ານ"),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: _phoneController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: '20 XXXX XXXX',
                                    fillColor: Colors
                                        .white, // Set the background color here
                                    filled: true,
                                  ),
                                  // The validator receives the text that the user has entered.
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Email Invalid';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: onSendOTP,
                              child: const Text(
                                'ສົ່ງລະຫັດ OTP',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                const Text(
                                  "ກະລຸກາປ້ອນລະຫັດ OTP",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                    'ກະລຸນາປ້ອນລະຫັດ OTP ພາຍໃນເວລາ $_countdown ວິນາທີ'),
                                const SizedBox(height: 20),
                                OtpTextField(
                                  numberOfFields: 4,
                                  borderColor: Colors.lightBlue,
                                  showFieldAsBox: true,
                                  onCodeChanged: (String code) {
                                    setState(() {
                                      otp = code;
                                    });
                                  },
                                  // end onSubmit
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: onSignIn,
                                  child: const Text(
                                    'ເຂົ້າສູ່ລະບົບ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: OutlinedButton(
                                  onPressed: () {
                                    _timer.cancel();
                                    _countdown = 60;
                                    setState(() {
                                      isSendOtp = false;
                                    });
                                  },
                                  child: const Text(
                                    'ຍົກເລີກ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                const SizedBox(height: 100),
                const Text(
                  'ໃນການດໍາເນີນການ, ທ່ານໄດ້ຍິນຍອມ ເງື່ອນໄຂການບໍລິກາ ແລະ ນະໂຍບາຍຄວາມເປັນສ່ວນຕົວຂອງ Lao booking.',
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
