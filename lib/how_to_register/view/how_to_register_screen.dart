import 'package:flutter/material.dart';
import 'package:laosbooking/widgets/ListfullProList.dart';

class HowToRegisterScreen extends StatelessWidget {
  const HowToRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ListfullProList(),
      ),
    );
  }
}
