import 'package:chronicle/feature/auth/pressentation/pages/auth_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
 

  static var  router = GoRouter(initialLocation: AuthPage.rout, routes: [
    GoRoute(path: AuthPage.rout ,builder: (context ,state){
      return const AuthPage();
    })
  ]);
}