import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:psych_ai/pages/chatbot_page.dart';

class UpcomingCard extends StatefulWidget {
  const UpcomingCard({super.key});

  @override
  State<UpcomingCard> createState() => _UpcomingCardState();
}

class _UpcomingCardState extends State<UpcomingCard> {
  void clikie() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const ChatBot()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 150,
      padding:
          const EdgeInsets.symmetric(vertical: 22).copyWith(left: 5, right: 20),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(206, 33, 255, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/bot.png',
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Psych.AI",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              // const SizedBox(height: 5),
              Text(
                "Your mental health assistant",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white70,
                    ),
              ),
              const SizedBox(height: 4),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChatBot()),
                  );
                },
                icon: const Icon(
                  Ionicons.chatbubble_ellipses_outline,
                ),
                label: const Text("Talk to me"),
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromRGBO(206, 33, 255, 1),
                  side: const BorderSide(color: Colors.white, width: 2),
                  fixedSize: const Size(200, 10),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}