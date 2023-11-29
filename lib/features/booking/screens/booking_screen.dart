import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/home/home_cubit.dart';
import '../../../cubit/home/home_states.dart';
import '../widgets/appbar.dart';
import '../widgets/body_view.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return const Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(0, 110),
            child: BookingAppBar(),
          ),
          body: BodyView(),
        );
      },
    );
  }
}
