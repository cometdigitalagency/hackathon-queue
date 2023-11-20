import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laobooking/widgets/FindQueueWidget.dart';

class FindQueueScreen extends StatelessWidget {
  const FindQueueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ກວດຄິວ"),
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: const FindQueueWidget(),
    );
  }
}
