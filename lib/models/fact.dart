import 'package:hive_flutter/hive_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'fact.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class Fact extends HiveObject {
  @HiveField(0)
  String text;

  @HiveField(1)
  DateTime updatedAt;

  Fact({required this.text, required this.updatedAt});

  factory Fact.fromJson(Map<String, dynamic> json) => _$FactFromJson(json);
  Map<String, dynamic> toJson() => _$FactToJson(this);
}

@JsonSerializable()
class CatImage {
  String url;
  CatImage({required this.url});

  factory CatImage.fromJson(Map<String, dynamic> json) =>
      _$CatImageFromJson(json);
}
