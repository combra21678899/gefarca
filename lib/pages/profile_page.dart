import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController(text: 'Marcos');
  final emailController = TextEditingController(text: 'marcos@gmail.com');
  final phoneController = TextEditingController(text: '3000000000');
  final roleController = TextEditingController(text: 'Administrador');

  bool _isEditing = false;
  bool _isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    roleController.dispose();
    super.dispose();
  }

  Future<void> _guardar() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    await Future.delayed(Duration(milliseconds: 800));
    setState(() {
      _isLoading = false;
      _isEditing = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Perfil actualizado correctamente'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _cancelar() {
    setState(() => _isEditing = false);
    // Restaura valores originales si cancela
    nameController.text = 'Marcos';
    emailController.text = 'marcos@gmail.com';
    phoneController.text = '3000000000';
    roleController.text = 'Administrador';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: Text('Perfil'),
        centerTitle: true,
        elevation: 0,
        actions: [
          if (!_isEditing)
            IconButton(
              icon: Icon(Icons.edit),
              tooltip: 'Editar perfil',
              onPressed: () => setState(() => _isEditing = true),
            ),
        ],
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Container(
            width: 400,
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  // Avatar
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.blue.shade50,
                        child: Icon(Icons.person, size: 50, color: Colors.blue),
                      ),
                      if (_isEditing)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 14,
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.camera_alt,
                                size: 14, color: Colors.white),
                          ),
                        ),
                    ],
                  ),

                  SizedBox(height: 16),

                  // Nombre (solo lectura o editable)
                  if (!_isEditing) ...[
                    Text(nameController.text,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(roleController.text,
                          style: TextStyle(color: Colors.blue, fontSize: 13)),
                    ),
                    SizedBox(height: 20),
                    _infoTile(Icons.email, emailController.text),
                    _infoTile(Icons.phone, phoneController.text),
                    SizedBox(height: 20),
                  ],

                  // Formulario de edición
                  if (_isEditing) ...[
                    SizedBox(height: 8),
                    Divider(),
                    SizedBox(height: 8),

                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Nombre',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Ingresa tu nombre' : null,
                    ),

                    SizedBox(height: 12),

                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Correo electrónico',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (v) {
                        if (v == null || v.isEmpty) return 'Ingresa tu correo';
                        if (!v.contains('@')) return 'Correo inválido';
                        return null;
                      },
                    ),

                    SizedBox(height: 12),

                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Teléfono',
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Ingresa tu teléfono' : null,
                    ),

                    SizedBox(height: 12),

                    TextFormField(
                      controller: roleController,
                      decoration: InputDecoration(
                        labelText: 'Rol',
                        prefixIcon: Icon(Icons.badge),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Ingresa el rol' : null,
                    ),

                    SizedBox(height: 24),

                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: _cancelar,
                            style: OutlinedButton.styleFrom(
                              minimumSize: Size(double.infinity, 48),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            child: Text('Cancelar'),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _guardar,
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 48),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            child: _isLoading
                                ? SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white),
                                  )
                                : Text('Guardar'),
                          ),
                        ),
                      ],
                    ),
                  ],

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoTile(IconData icon, String text) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 20),
          SizedBox(width: 12),
          Text(text, style: TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}