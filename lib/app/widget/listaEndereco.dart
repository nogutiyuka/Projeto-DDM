import 'package:app_motorista/app/aplicacao/ap_endereco.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoCidade.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoEndereco.dart';
import 'package:flutter/material.dart';

class ListaEndereco extends StatelessWidget {
  const ListaEndereco({super.key});

  Future<List<DTOEndereco>> buscarTodos() async {
    ApEndereco apEndereco = ApEndereco();
    print("Instanciando ApEndereco e fazendo requisição de todas os endereços");
    return await apEndereco.buscarTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Endereços'),
      ),
      body: FutureBuilder<List<DTOEndereco>>(
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
              final endereco = lista[index];
              return ExpansionTile(
                leading: Icon(Icons.house),
                title: Text(endereco.rua),
                children: <Widget>[
                  ListTile(
                    title: Text('Detalhes do Endereço'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Rua: ${endereco.rua}'),
                        Text('Numero: ${endereco.numero}'),
                        Text('Bairro: ${endereco.bairro}'),
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
