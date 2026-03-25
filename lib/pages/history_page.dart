import 'package:flutter/material.dart';
import '../services/app_data.dart';


class HistoryPage extends StatelessWidget {
  final List<Map<String, String>> history = [
    {'date': '2024-01-01', 'product': 'Acetaminofen', 'action': 'Agregado'},
    {'date': '2024-01-02', 'product': 'Dolex', 'action': 'Eliminado'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Historial')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(hintText: 'Buscar historial...')),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, index) {
                  final h = history[index];
                  return ListTile(
                    title: Text(h['product']!),
                    subtitle: Text(h['date']!),
                    trailing: Text(h['action']!),
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