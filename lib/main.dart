import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:flutter_application_1/services/auth_service.dart';
import 'package:flutter_application_1/services/categoria_service.dart';
import 'package:flutter_application_1/services/product_service.dart';
import 'package:flutter_application_1/services/proveedor_service.dart';
import 'package:flutter_application_1/theme/my_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => ProductService()),
        ChangeNotifierProvider(create: (_) => CategoriaService()),
        ChangeNotifierProvider(create: (_) => ProveedorService()),
      ],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Examen App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: MyTheme.myTheme,
    );
  }
}
