import 'package:json_annotation/json_annotation.dart';
part 'user_modle.g.dart';
@JsonSerializable()

class UserModle {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String photoUrl;

  UserModle({required this.id, required this.name, required this.photoUrl});
  factory UserModle.fromJson(Map<String, dynamic> json) =>
      _$UserModleFromJson(json);

  Map<String, dynamic> toJson() => _$UserModleToJson(this);
}
