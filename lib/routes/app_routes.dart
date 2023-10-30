import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/screen.dart';

class AppRoutes {
  static const initialRoute = 'home';
  static Map<String, Widget Function(BuildContext)> routes = {
    'home': (BuildContext context) => const Home(),
    'login': (BuildContext context) => const LoginScreen(),
    'list': (BuildContext context) => const ListProductScreen(),
    'edit': (BuildContext context) => const EditProductScreen(),
    'add_user': (BuildContext context) => const RegisterUserScreen(),
    'listProveedor': (BuildContext context) => const ListProvScreen(),
    'listCategoria': (BuildContext context) => const ListCategScreen(),
    'editCategoria': (BuildContext context) => const EditCategScreen(),
    'editProveedor': (BuildContext context) => const EditProveedorScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const ErrorScreen(),
    );
  }
}
