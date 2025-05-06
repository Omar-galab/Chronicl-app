import 'package:chronicle/core/failuer/failuer.dart';
import 'package:chronicle/core/modle/either.dart';
import 'package:chronicle/feature/auth/data/datasource/auth_remote_datasource.dart';
import 'package:chronicle/feature/auth/domain/modle/user_modle.dart';
import 'package:chronicle/feature/auth/domain/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImp1 implements AuthRepository  {
  final AuthRemoteDatasource authRemoteDatasource;

  AuthRepositoryImp1({required this.authRemoteDatasource});
  @override
  Future<Either<Failuer, UserModle>> loginWithGoogle()async {
    try{
      final GoogleSignInAccount? googleUser =await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =await googleUser?.authentication;
      final credential =GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final firebaseCredentials = await FirebaseAuth.instance.signInWithCredential(credential);
      final firebaseToken = await firebaseCredentials.user?.getIdToken();
      final requset = await authRemoteDatasource.loginWithGoogle(firebaseToken!);
      return Either.right(requset);
    }
    
    on DioException catch(e){
      return Either.left(AuthFailuer(message: e.response?.data['message']));
    }
    on Exception catch(e){
      return Either.left(AuthFailuer(message: 'Auth Failuer'));
    }
  }


}