import 'package:app_motorista/app/aplicacao/ap_cidade.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoCidade.dart';
import 'package:flutter/material.dart';

class ListaCidade extends StatelessWidget {
  const ListaCidade({super.key});

  Future<List<DTOCidade>> buscarTodos() async {
    ApCidade apCidade = ApCidade();
    print("Instanciando ApCidade e fazendo requisição de todas as cidades");
    return await apCidade.buscarTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Cidades'),
      ),
      body: FutureBuilder<List<DTOCidade>>(
        future: buscarTodos(),
        builder: (context, consulta) {
          final dados = consulta.data;

          if (dados == null || consulta.hasError) {
            return Center(child: Text('Dados não encontrados.'));
          }

          final lista = dados;
          return ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context, index) {
              final cidade = lista[index];
              return ExpansionTile(
                leading: Icon(Icons.location_city),
                title: Text(cidade.nome),
                children: <Widget>[
                  ListTile(
                    title: Text('Detalhes da Cidade'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nome da Cidade: ${cidade.nome}'),
                        Text('Estado: ${cidade.estado.nome}'),
                        Text('Sigla do Estado: ${cidade.estado.sigla}'),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
