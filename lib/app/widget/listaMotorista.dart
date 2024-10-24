import 'package:app_motorista/app/aplicacao/ap_motorista.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoMotorista.dart';
import 'package:flutter/material.dart';

class ListaMotorista extends StatelessWidget {
  const ListaMotorista({super.key});

  Widget CriarBotao(String rotulo, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(rotulo),
    );
  }

  Future<List<DtoMotorista>> buscarTodos() async {
    ApMotorista aplicacao = ApMotorista();
    print("Aqui instanciou o APmotorista e irá fazer a requisição");
    return await aplicacao.buscarTodos();
  }

@override
Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Lista Motoristas')),
      body: FutureBuilder<List<DtoMotorista>>(
          future: buscarTodos(),
          builder: (context, consulta) {
            var dados = consulta.data;
            if (dados == null) {
              return Text('Dados não encontrados.');
            } else {
              final lista = consulta.data!;
              return ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  var motorista = lista[index];
                  return ExpansionTile(
                    leading: Icon(Icons.person),
                    title: Text(motorista.nome),
                    subtitle: Text(motorista.email),
                    children: <Widget>[
                      ListTile(
                        title: Text('Detalhes do Motorista'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Nome: ${motorista.nome}'),
                            Text('Tipo: ${motorista.telefone}'),
                            Text('Descrição: ${motorista.email}')
                          ],
                        )
                      ),
                    ],
                  );
                },
              );
            }
          }),
 );
}


}