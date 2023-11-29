import 'package:flutter/material.dart';

import '../widgets/appbar.dart';
import '../widgets/body_view.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, 110),
        child: BookingAppBar(),
      ),
      body: BodyView(),
    );
  }
}
