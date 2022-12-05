// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: depend_on_referenced_packages, file_names

import 'package:json_annotation/json_annotation.dart';

class DateTimeEpochConverter implements JsonConverter<DateTime, String> {
  const DateTimeEpochConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime object) => object.toIso8601String();
}
