import 'package:mypetmeds2/models/medication.dart';

class User {
  final String id;
  final String name;
  final String age;
  final String avatarUrl;
  final Map<String, Medication> meds;

  const User({
    required this.meds,
    required this.id,
    required this.name,
    required this.age,
    required this.avatarUrl,
  });
}
