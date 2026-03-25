import 'package:flutter/material.dart';

class SuppliersPage extends StatelessWidget {
  final List<Map<String, String>> suppliers = [
    {'name': 'Distribuidora Central', 'phone': '3101111111', 'city': 'Cartagena'},
    {'name': 'Farmalisto Pro', 'phone': '3202222222', 'city': 'Barranquilla'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Proveedores')),
      body: ListView.builder(
        itemCount: suppliers.length,
        itemBuilder: (context, index) {
          final s = suppliers[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.local_shipping),
              title: Text(s['name']!),
              subtitle: Text('${s['phone']} - ${s['city']}'),
            ),
          );
        },
      ),
    );
  }
}