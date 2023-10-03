// ignore_for_file: public_member_api_docs, sort_constructors_first
class DoctorModel {
  final String name;
  final String position;
  final int averageReview;
  final int totalReviews;
  final String profile;
  DoctorModel({
    required this.name,
    required this.position,
    required this.averageReview,
    required this.totalReviews,
    required this.profile,
  });
}

final List<DoctorModel> expertCounsellors = [
  DoctorModel(
    name: "Hiruluk",
    position: "Cognitive Psychologist",
    averageReview: 4,
    totalReviews: 200,
    profile: "assets/doctor_1.jpg",
  ),
  DoctorModel(
    name: "Trafalgar D. Law",
    position: "Clinical Psychologist",
    averageReview: 3,
    totalReviews: 256,
    profile: "assets/doctor_2.jpg",
  ),
  DoctorModel(
    name: "Kureha",
    position: "Counseling Psychologist",
    averageReview: 4,
    totalReviews: 130,
    profile: "assets/doctor_3.jpg",
  ),
  DoctorModel(
    name: "Tony Chopper",
    position: "Health Psychologist",
    averageReview: 5,
    totalReviews: 350,
    profile: "assets/doc_4.jpeg",
  )
];
