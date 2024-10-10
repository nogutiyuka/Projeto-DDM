import 'package:app_motorista/app/widget/lista.Cliente.dart';
import 'package:flutter/material.dart';
import 'package:app_motorista/app/rotas/rotas.dart';


class MyApp extends StatelessWidget{
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo Motorista',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        Rotas.home: (context) => const ListaCliente()
      }
    );
  }

}


//StatelessWidget é sem estado, ou seja, não é mutavel
//StateFull é com estado, ou seja, é mutavel