import 'package:chronicle/core/failuer/failuer.dart';
import 'package:chronicle/core/modle/either.dart';
import 'package:chronicle/feature/auth/domain/modle/user_modle.dart';

abstract class AuthRepository {
Future <Either<Failuer ,UserModle>> loginWithGoogle();

}