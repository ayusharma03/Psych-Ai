import 'package:psych_ai/data/psychologist_model.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ExpertCounsellors extends StatelessWidget {
  const ExpertCounsellors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(expertCounsellors.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(expertCounsellors[index].profile),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dr. ${expertCounsellors[index].name}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(expertCounsellors[index].position),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        Ionicons.star,
                        color: Colors.yellow[700],
                        size: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4, right: 6),
                        child: Text(
                          "${expertCounsellors[index].averageReview}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text("${expertCounsellors[index].totalReviews} Reviews")
                    ],
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
