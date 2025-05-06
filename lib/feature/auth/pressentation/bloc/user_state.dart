import 'package:chronicle/feature/auth/domain/modle/user_modle.dart';

enum UserStatus{
  initial,
  loading,
  success,
  error,
}
class UserState {
  final UserStatus status;
  final String? errorMessage;
  final UserModle? userModle;

  UserState._({required this.status, this.errorMessage, this.userModle});


  factory UserState.initial() => UserState._(status: UserStatus.initial);
  UserState  copyWith({UserStatus? status, UserModle? userModle, String? errorMessage}){
    return UserState._(
      status: status?? this.status,
      errorMessage: errorMessage??this.errorMessage,
      userModle: userModle??this.userModle,
    );
    
  }

}