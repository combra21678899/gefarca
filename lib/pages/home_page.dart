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
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: Text('Gefarca'),
        centerTitle: true,
        elevation: 0,
      ),

      // ✅ Todo dentro de un solo CustomScrollView
      body: CustomScrollView(
        slivers: [

          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([

                // Bienvenido
                Text(
                  'Bienvenido 👋',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'Panel de control',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                SizedBox(height: 20),

                // Tarjetas resumen fila 1
                Row(
                  children: [
                    Expanded(child: _buildCard('Productos', '120', Icons.inventory)),
                    SizedBox(width: 10),
                    Expanded(child: _buildCard('Usuarios', '18', Icons.people)),
                  ],
                ),
                SizedBox(height: 10),

                // Tarjetas resumen fila 2
                Row(
                  children: [
                    Expanded(child: _buildCard('Movimientos', '240', Icons.swap_horiz)),
                    SizedBox(width: 10),
                    Expanded(child: _buildCard('Alertas', '5', Icons.warning)),
                  ],
                ),
                SizedBox(height: 20),

                // Título módulos
                Text(
                  'Módulos',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),

              ]),
            ),
          ),

          // ✅ SliverGrid maneja su propio scroll sin conflictos
          SliverPadding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 24),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final item = menu[index];
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(context, item['route']),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 8),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(item['icon'], size: 40, color: Colors.blue),
                          SizedBox(height: 10),
                          Text(
                            item['title'],
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: menu.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.4, // ✅ Controla el alto de cada celda
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildCard(String title, String value, IconData icon) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 30, color: Colors.blue),
          SizedBox(height: 10),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(title, style: TextStyle(color: Colors.grey[600])),
        ],
      ),
    );
  }
}