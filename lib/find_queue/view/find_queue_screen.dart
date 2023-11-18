import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FindQueueScreen extends StatelessWidget {
  const FindQueueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ກວດຄິວ"),
        leading: IconButton(
          onPressed: () {
            context.go("/");
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }
}
