import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laobooking/widgets/ScheduleConsular.dart';

class CheckBookDateScreen extends StatelessWidget {
  const CheckBookDateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ຕາລາງວັນທີ່"),
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ScheduleConsularList(
        onSelect: (schedule) {},
      ),
    );
  }
}
