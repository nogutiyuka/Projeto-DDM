import 'package:app_motorista/app/widget/cadastroMotorista.dart';
import 'package:app_motorista/app/widget/home.dart';
import 'package:app_motorista/app/widget/listaMotorista.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> { //para carregar todos os estados
  final _formKey = GlobalKey<FormState>();

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 243, 253, 247),
    ),
    backgroundColor: const Color.fromARGB(255, 243, 253, 247),
    body: Center(
      child: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: 300,
              padding: const EdgeInsets.only(top: 100.0, left: 16.0, right: 16.0, bottom: 16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 50.0), //espçao p logo
                    Text(
                      'Login',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0),

                    // Email
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16.0),

                    // Senha
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        labelText: 'Senha',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 24.0),

                    // Login
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                        );
                      },
                      child: Text('Login'),
                    ),

                    // Cadastro
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CadastroMotorista(),
                          ),
                        );
                      },
                      child: Text('Criar Conta'),
                    ),
                  ],
                ),
              ),
            ),

            // Logo
            Positioned(
              top: 0,
              child: Image.asset(
                'lib/assets/logo.png',
                height: 200,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}
