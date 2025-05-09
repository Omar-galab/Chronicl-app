import 'package:chronicle/feature/auth/domain/modle/user_modle.dart';
import 'package:dio/dio.dart';

class AuthRemoteDatasource {
final Dio dio;

  AuthRemoteDatasource({required this.dio});
  Future<UserModle> loginWithGoogle (String token)async{
    var requset = await dio.post('users/login' ,
    data: {'token':token});
    return UserModle.fromJson(requset.data);
    
  }

}