import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/booking_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const TempleBookingApp());
}

class TempleBookingApp extends StatelessWidget {
  const TempleBookingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookingProvider(),
      child: MaterialApp(
        title: 'Temple Booking',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: const Color(0xFFF0FDF4),
          fontFamily: 'Roboto',
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
