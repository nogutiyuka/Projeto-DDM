import 'package:flutter/material.dart';

class Detalhescliente extends StatelessWidget {
  const Detalhescliente({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
    TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Lista Clientes'))
          ],
        );
  }
}
