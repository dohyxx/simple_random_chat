import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'key')
enum UserType {
  guest(1, "Guest");

  final int key;
  final String name;

  const UserType(this.key, this.name);
}
