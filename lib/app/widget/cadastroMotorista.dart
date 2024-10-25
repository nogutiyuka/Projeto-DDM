import 'package:app_motorista/app/aplicacao/ap_motorista.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoMotorista.dart';
import 'package:flutter/material.dart';

class CadastroMotorista extends StatelessWidget {
  final _cadastroKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _nomeController = TextEditingController();
    final _telefoneController = TextEditingController();
    final _senhaController = TextEditingController();
    final _emailController = TextEditingController();

    Widget CriarBotao(BuildContext context, String rota, String rotulo) {
      return TextButton(
          onPressed: () => Navigator.pushNamed(context, rota),
          child: Text(rotulo));
    }

    Future<void> criarMotorista() async {
      if (_cadastroKey.currentState!.validate()) {
        final nome = _nomeController.text;
        final telefone = _telefoneController.text;
        final senha = _senhaController.text;
        final email = _emailController.text;

        DtoMotorista dto = DtoMotorista(
          nome: nome,
          telefone: telefone,
          senha: senha,
          email: email,
        );

        ApMotorista apMotorista = ApMotorista();
        await apMotorista.salvar(dto);

        _nomeController.clear();
        _telefoneController.clear();
        _senhaController.clear();
        _emailController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Motorista salvo com sucesso')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Motorista'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _cadastroKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _telefoneController,
                decoration: InputDecoration(labelText: 'Telefone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o telefone';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _senhaController,
                decoration: InputDecoration(labelText: 'Senha'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a senha';
                  }
                  return null;
                },
                obscureText: true, 
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await criarMotorista();
                  Navigator.pop(context); // Chama a função ao pressionar o botão
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
