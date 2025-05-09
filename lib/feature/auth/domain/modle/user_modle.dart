import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_modle.g.dart';
@JsonSerializable()

class UserModle  extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String photoUrl;

  const UserModle({required this.id, required this.name, required this.photoUrl});
  factory UserModle.fromJson(Map<String, dynamic> json) =>
      _$UserModleFromJson(json);

  Map<String, dynamic> toJson() => _$UserModleToJson(this);
  
  @override
  // TODO: implement props
  List<Object?> get props => [id, name, photoUrl];
}
