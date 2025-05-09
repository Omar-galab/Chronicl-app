import 'package:chronicle/feature/auth/domain/modle/user_modle.dart';
import 'package:equatable/equatable.dart';

enum UserStatus{
  initial,
  loading,
  success,
  error,
}
class UserState extends Equatable{
  final UserStatus status;
  final String? errorMessage;
  final UserModle? userModle;

  const UserState._({required this.status, this.errorMessage, this.userModle});


  factory UserState.initial() => const UserState._(status: UserStatus.initial);
  UserState  copyWith({UserStatus? status, UserModle? userModle, String? errorMessage}){
    return UserState._(
      status: status?? this.status,
      errorMessage: errorMessage??this.errorMessage,
      userModle: userModle??this.userModle,
    );
    
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [status,errorMessage ,UserModle];

}