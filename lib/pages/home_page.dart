import 'package:psych_ai/widgets/nearby_doctors.dart';
import 'package:psych_ai/widgets/upcoming_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(14),
        children: [
          const UpcomingCard(),
          const SizedBox(height: 20),
          Text(
            "Recommended Psychologists",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 15),
          const ExpertCounsellors(),
        ],
      ),
    );
  }
}
