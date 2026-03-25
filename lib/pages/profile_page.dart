import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil')),
      body: Center(
        child: Container(
          width: 360,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(radius: 42, child: Icon(Icons.person, size: 40)),
              SizedBox(height: 16),
              Text('Marcos', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('Administrador'),
              SizedBox(height: 20),
              ListTile(leading: Icon(Icons.email), title: Text('marcos@gmail.com')),
              ListTile(leading: Icon(Icons.phone), title: Text('3000000000')),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: Text('Editar perfil'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}