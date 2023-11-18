import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:laobooking/laosbooking.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Booking> reservationList = getBookingList();
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
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                context.push("/history");
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
                              onTap: () {
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
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                context.push("/find_queue");
                              },
                              child: Container(
                                decoration: customDecoration,
                                padding: const EdgeInsets.all(10),
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.playlist_add_check,
                                      size: 40,
                                    ),
                                    SizedBox(height: 10),
                                    Text("ກວດຄິວ")
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                context.push('/check_booking_date');
                              },
                              child: Container(
                                decoration: customDecoration,
                                padding: const EdgeInsets.all(10),
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.calendar_month,
                                      size: 40,
                                    ),
                                    SizedBox(height: 10),
                                    Text("ຕາລາງວັນທີ່")
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
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
                                  width: 180,
                                  height: 180,
                                  child: Image.network(
                                    list.image!,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        // Image has finished loading
                                        return child;
                                      } else {
                                        // Image is still loading
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    (loadingProgress
                                                            .expectedTotalBytes ??
                                                        1)
                                                : null,
                                          ),
                                        );
                                      }
                                    },
                                    errorBuilder: (BuildContext context,
                                        Object error, StackTrace? stackTrace) {
                                      return Text(
                                          'Failed to load image: $error');
                                    },
                                  ),
                                ),
                                const SizedBox(height: 18),
                                Text(
                                  list.name.toUpperCase(),
                                  style: const TextStyle(fontSize: 24),
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
