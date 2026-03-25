import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  late AnimationController _animController;
  late Animation<double> _scaleAnimation;

  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();

    // ✅ Animación de escala al entrar
    _animController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _animController,
      curve: Curves.elasticOut,
    );

    _animController.forward();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    _animController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    // Cierra el teclado
    FocusScope.of(context).unfocus();

    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor completa todos los campos'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    // Simula delay de red
    await Future.delayed(Duration(seconds: 1));

    setState(() => _isLoading = false);

    if (email == 'admin' && password == '1234') {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Credenciales incorrectas'),
          backgroundColor: Colors.red,
        ),
      );

      // ✅ Limpia la contraseña y regresa el foco
      passwordController.clear();
      FocusScope.of(context).requestFocus(passwordFocus);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      body: Center(
        child: SingleChildScrollView(

          // ✅ ScaleTransition envuelve la tarjeta
          child: ScaleTransition(
            scale: _scaleAnimation,

            child: Container(
              width: 350,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 10),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  // Logo / Ícono
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.blue.shade50,
                    child: Icon(Icons.local_pharmacy,
                        size: 40, color: Colors.blue),
                  ),

                  SizedBox(height: 16),

                  Text(
                    'GEFARCA',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),

                  SizedBox(height: 4),

                  Text(
                    'Sistema de farmacia',
                    style: TextStyle(color: Colors.grey[600]),
                  ),

                  SizedBox(height: 24),

                  // ✅ Campo usuario con foco controlado
                  TextField(
                    controller: emailController,
                    focusNode: emailFocus,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(passwordFocus),
                    decoration: InputDecoration(
                      labelText: 'Usuario',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  SizedBox(height: 12),

                  // ✅ Campo contraseña con mostrar/ocultar
                  TextField(
                    controller: passwordController,
                    focusNode: passwordFocus,
                    obscureText: _obscurePassword,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => login(),
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () => setState(
                            () => _obscurePassword = !_obscurePassword),
                      ),
                    ),
                  ),

                  SizedBox(height: 24),

                  // ✅ Botón con loading spinner
                  ElevatedButton(
                    onPressed: _isLoading ? null : login,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: _isLoading
                        ? SizedBox(
                            height: 22,
                            width: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            'Iniciar sesión',
                            style: TextStyle(fontSize: 16),
                          ),
                  ),

                  SizedBox(height: 8),

                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, '/register'),
                    child: Text('¿No tienes cuenta? Crear cuenta'),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}