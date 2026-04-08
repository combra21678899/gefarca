import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  final searchController = TextEditingController();

  final List<Map<String, String>> history = [
    {'date': '2024-01-01', 'product': 'Acetaminofen', 'action': 'Agregado'},
    {'date': '2024-01-02', 'product': 'Dolex', 'action': 'Eliminado'},
    {'date': '2024-01-03', 'product': 'Ibuprofeno', 'action': 'Agregado'},
    {'date': '2024-01-04', 'product': 'Amoxicilina', 'action': 'Editado'},
  ];

  List<Map<String, String>> _filtered = [];

  @override
  void initState() {
    super.initState();
    _filtered = List.from(history);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _search(String query) {
    setState(() {
      _filtered = history.where((h) {
        final q = query.toLowerCase();
        return h['product']!.toLowerCase().contains(q) ||
               h['action']!.toLowerCase().contains(q) ||
               h['date']!.contains(q);
      }).toList();
    });
  }

  Color _actionColor(String action) {
    switch (action) {
      case 'Agregado': return Colors.green;
      case 'Eliminado': return Colors.red;
      case 'Editado':   return Colors.orange;
      default:          return Colors.grey;
    }
  }

  IconData _actionIcon(String action) {
    switch (action) {
      case 'Agregado': return Icons.add_circle;
      case 'Eliminado': return Icons.remove_circle;
      case 'Editado':   return Icons.edit;
      default:          return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: Text('Historial'),
        centerTitle: true,
        elevation: 0,
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            // Buscador
            TextField(
              controller: searchController,
              onChanged: _search,
              decoration: InputDecoration(
                hintText: 'Buscar por producto, acción o fecha...',
                prefixIcon: Icon(Icons.search),
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                          _search('');
                        },
                      )
                    : null,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            SizedBox(height: 12),

            // Contador de resultados
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${_filtered.length} registro(s)',
                style: TextStyle(color: Colors.grey[600], fontSize: 13),
              ),
            ),

            SizedBox(height: 8),

            // Lista
            Expanded(
              child: _filtered.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search_off, size: 60, color: Colors.grey[400]),
                          SizedBox(height: 10),
                          Text('Sin resultados',
                              style: TextStyle(color: Colors.grey[500])),
                        ],
                      ),
                    )
                  : ListView.separated(
                      itemCount: _filtered.length,
                      separatorBuilder: (_, __) => SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final h = _filtered[index];
                        final color = _actionColor(h['action']!);

                        return Container(
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 4),
                            ],
                          ),
                          child: Row(
                            children: [

                              // Ícono de acción
                              CircleAvatar(
                                backgroundColor: color.withOpacity(0.1),
                                child: Icon(_actionIcon(h['action']!),
                                    color: color, size: 20),
                              ),

                              SizedBox(width: 12),

                              // Info
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      h['product']!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      h['date']!,
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),

                              // Badge de acción
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: color.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: color, width: 1),
                                ),
                                child: Text(
                                  h['action']!,
                                  style: TextStyle(
                                      color: color,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),

                            ],
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
}