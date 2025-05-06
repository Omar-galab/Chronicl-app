abstract class Failuer {
  final String message;
  Failuer({required this.message});

}
class AuthFailuer extends Failuer{
  AuthFailuer({required super.message});
  
}
