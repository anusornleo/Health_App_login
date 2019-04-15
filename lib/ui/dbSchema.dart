import 'package:meta/meta.dart';

class Replies {

  final String name;  
  final int age;
  final String job;

  Replies({
    @required this.name,
    @required this.age,
    @required this.job
  });

 Map<String, dynamic> toJson() =>
  {
    'name': name,
    'age': age,
    'job': job
  };

}