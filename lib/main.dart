import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tickets_app/app_routes.dart';
import 'package:tickets_app/screens/home/all_tickets.dart';
import 'package:tickets_app/screens/hotel-detail.dart';
import 'package:tickets_app/screens/tickets/ticket_screen.dart';

import 'base/bottom_nav_bar.dart';
import 'screens/home/all_hotels.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.homePage: (context) => BottomNavBar(),
        AppRoutes.allTickets: (context) => const AllTickets(),
        AppRoutes.ticketScreen: (context) => const TicketScreen(),
        AppRoutes.allHotels: (context) => const AllHotels(),
        AppRoutes.hotelDetail: (context) => const HotelDetail(),
      },
    );
  }
}
