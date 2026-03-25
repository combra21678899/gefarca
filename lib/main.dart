import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final List<Map<String, dynamic>> menu = [
    {'title': 'Inventario', 'icon': Icons.inventory, 'route': '/inventory'},
    {'title': 'Usuarios', 'icon': Icons.people, 'route': '/users'},
    {'title': 'Historial', 'icon': Icons.history, 'route': '/history'},
    {'title': 'Proveedores', 'icon': Icons.local_shipping, 'route': '/suppliers'},
    {'title': 'Reportes', 'icon': Icons.bar_chart, 'route': '/reports'},
    {'title': 'Perfil', 'icon': Icons.person, 'route': '/profile'},
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: Text('Gefarca'),
        centerTitle: true,
        elevation: 0,
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Bienvenido
            Text('Bienvenido 👋',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('Panel de control',
              style: TextStyle(color: Colors.grey[600], fontSize: 13)),

            SizedBox(height: 16),

            // ✅ Tarjetas resumen con altura fija pequeña
            SizedBox(
              height: screenHeight * 0.10,
              child: Row(
                children: [
                  Expanded(child: _buildCard('Productos', '120', Icons.inventory)),
                  SizedBox(width: 10),
                  Expanded(child: _buildCard('Usuarios', '18', Icons.people)),
                ],
              ),
            ),

            SizedBox(height: 10),

            SizedBox(
              height: screenHeight * 0.10,
              child: Row(
                children: [
                  Expanded(child: _buildCard('Movimientos', '240', Icons.swap_horiz)),
                  SizedBox(width: 10),
                  Expanded(child: _buildCard('Alertas', '5', Icons.warning)),
                ],
              ),
            ),

            SizedBox(height: 16),

            Text('Módulos',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

            SizedBox(height: 10),

            // ✅ Expanded ocupa el espacio restante exacto sin overflow
            Expanded(
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: menu.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  // ✅ childAspectRatio dinámico según pantalla
                  childAspectRatio: (screenWidth / 2) /
                      ((screenHeight - screenHeight * 0.20 - 200) / 3),
                ),
                itemBuilder: (context, index) {
                  final item = menu[index];
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(context, item['route']),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 6),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(item['icon'], size: 32, color: Colors.blue),
                          SizedBox(height: 8),
                          Text(
                            item['title'],
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, String value, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Row(
        // ✅ Row en lugar de Column para que quepan en menos altura
        children: [
          Icon(icon, size: 26, color: Colors.blue),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(title,
                style: TextStyle(color: Colors.grey[600], fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}