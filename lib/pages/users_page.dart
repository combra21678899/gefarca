import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  final List<Map<String, String>> users = [
    {'id': '1', 'name': 'emiro', 'email': 'emiro@gmail.com', 'phone': '123456', 'role': 'cliente'},
    {'id': '2', 'name': 'juan', 'email': 'juan@gmail.com', 'phone': '987654', 'role': 'cliente'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gestión de Usuarios')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(hintText: 'Buscar usuario...')),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final u = users[index];
                  return ListTile(
                    title: Text(u['name']!),
                    subtitle: Text('${u['email']} - ${u['phone']}'),
                    trailing: Text(u['role']!),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
