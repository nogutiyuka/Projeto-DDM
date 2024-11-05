import 'package:app_motorista/app/aplicacao/ap_cidade.dart';
import 'package:app_motorista/app/aplicacao/ap_endereco.dart';
import 'package:app_motorista/app/aplicacao/ap_estado.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoEstado.dart';
import 'package:flutter/material.dart';

class ListaEstado extends StatelessWidget {
  const ListaEstado({super.key});

  Widget CriarBotao(String rotulo, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(rotulo),
    );
  }
  
  Future<List<DTOEstado >> buscarTodos() async {
    ApEstado apEstado = ApEstado();
    print("Aqui instanciou o ApEstado e irá fazer a requisição");
    return await apEstado.buscarTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Estado'),
      ), //appBar
      body: FutureBuilder(
          future: buscarTodos(),
          builder: (context, consulta) {
            var dados = consulta.data;
            if (dados == null) {
              return Center(child: Text('Dados não encontrados.'));
            } else {
              final lista = consulta.data!;
              return ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  var estado = lista[index];
                  return ExpansionTile(
                    leading: Icon(Icons.person),
                    title: Text(estado.nome),
                    children: <Widget>[
                      ListTile(
                        title: Text('Detalhes do Estado'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Nome: ${estado.nome}'),
                            Text('Sigla: ${estado.sigla}')
                          ],
                        ),
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
