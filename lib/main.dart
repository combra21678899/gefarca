import 'package:flutter/material.dart';

// PAGES
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/inventory_page.dart';
import 'pages/add_product_page.dart';
import 'pages/users_page.dart';
import 'pages/history_page.dart';
import 'pages/profile_page.dart';
import 'pages/register_page.dart';
import 'pages/suppliers_page.dart';
import 'pages/reports_page.dart';

void main() {
  runApp(GefarcaApp());
}

class GefarcaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gefarca',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      initialRoute: '/',

      routes: {
        // 🔐 Auth
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),

        // 🏠 Principal
        '/home': (context) => HomePage(),

        // 📦 Inventario
        '/inventory': (context) => InventoryPage(),
        '/add': (context) => AddProductPage(),

        // 👥 Usuarios
        '/users': (context) => UsersPage(),

        // 📜 Historial
        '/history': (context) => HistoryPage(),

        // 👤 Perfil
        '/profile': (context) => ProfilePage(),

        // 🚚 Proveedores
        '/suppliers': (context) => SuppliersPage(),

        // 📊 Reportes
        '/reports': (context) => ReportsPage(),
      },
    );
  }
}
