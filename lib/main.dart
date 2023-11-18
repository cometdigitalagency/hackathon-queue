import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackaton_2023/check_booking_date/check_booking_date.dart';
import 'package:hackaton_2023/find_queue/view/find_queue_screen.dart';
import 'package:hackaton_2023/finish_booking/view/finish_booking_screen.dart';
import 'package:hackaton_2023/history/history.dart';
import 'package:hackaton_2023/how_to_register/view/how_to_register_screen.dart';
import 'package:hackaton_2023/login/login.dart';

import 'booking_form/view/booking_screen.dart';
import 'home/view/home_screen.dart';

// GoRouter configuration
final _router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/booking-form/:id',
      builder: (context, state) => BookingScreen(
        formId: int.parse(state.pathParameters['id']!),
      ),
    ),
    GoRoute(
      path: '/finish_booking',
      builder: (context, state) => const FinishBookingScreen(),
    ),
    GoRoute(
      path: '/history',
      builder: (context, state) => const HistoryScreen(),
    ),
    GoRoute(
      path: '/how_to_register',
      builder: (context, state) => const HowToRegisterScreen(),
    ),
    GoRoute(
      path: '/check_booking_date',
      builder: (context, state) => const CheckBookDateScreen(),
    ),
    GoRoute(
      path: '/find_queue',
      builder: (context, state) => const FindQueueScreen(),
    ),
  ],
);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: _router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        textTheme: GoogleFonts.notoSansLaoTextTheme(),
      ),
    );
  }
}
