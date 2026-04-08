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
  runApp(const GefarcaApp());
}

class GefarcaApp extends StatelessWidget {
  const GefarcaApp({super.key});  // ✅ Usar super.key (Dart 2.17+)

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
        '/': (context) => LoginPage(),  // ❌ Quitar const
        '/register': (context) => RegisterPage(),  // ❌ Quitar const
        '/home': (context) => HomePage(),  // ❌ Quitar const
        '/inventory': (context) => InventoryPage(),  // ❌ Quitar const
        '/add': (context) => AddProductPage(),  // ❌ Quitar const (ya tiene const constructor)
        '/users': (context) => UsersPage(),  // ❌ Quitar const
        '/history': (context) => HistoryPage(),  // ❌ Quitar const
        '/profile': (context) => ProfilePage(),  // ❌ Quitar const
        '/suppliers': (context) => SuppliersPage(),  // ❌ Quitar const
        '/reports': (context) => ReportsPage(),  // ❌ Quitar const
      },
    );
  }
}