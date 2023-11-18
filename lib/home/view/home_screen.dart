import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:laosbooking/laosbooking.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Booking> reservationList = getReservationList();
    final BoxDecoration customDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 2,
          offset: const Offset(0, 3),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        title: const Text(
          "LAO BOOKING",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            context.go("/history");
                          },
                          child: Container(
                            decoration: customDecoration,
                            padding: const EdgeInsets.all(10),
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.history,
                                  size: 40,
                                ),
                                SizedBox(height: 10),
                                Text("ປະຫວັດການຈອງ")
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            context.go('/how_to_register');
                          },
                          child: Container(
                            decoration: customDecoration,
                            padding: const EdgeInsets.all(10),
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.question_mark,
                                  size: 40,
                                ),
                                SizedBox(height: 10),
                                Text("ວິທີການສະໝັກ")
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                Column(
                  children: reservationList
                      .map(
                        (list) => GestureDetector(
                          onTap: () {
                            context.go('/booking-form/${list.id}');
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: customDecoration,
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 200,
                                  height: 200,
                                  child: Image.network(list.image!),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  list.name.toUpperCase(),
                                  style: const TextStyle(fontSize: 28),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
