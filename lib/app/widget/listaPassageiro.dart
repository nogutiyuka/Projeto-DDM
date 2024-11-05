import 'package:app_motorista/app/aplicacao/ap_passageiro.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dto_passageiro.dart';
import 'package:flutter/material.dart';

class ListaPassageiro extends StatelessWidget {
  const ListaPassageiro({super.key});

  Widget CriarBotao(String rotulo, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(rotulo),
    );
  }
  
  Future<List<DtoPassageiro>> buscarTodos() async {
    ApPassageiro apPassageiro = ApPassageiro();

    print("Aqui instanciou o ApPassageiro e irá fazer a requisição");
    return await apPassageiro.buscarTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Passageiro'),
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
                  var passageiro = lista[index];
                  return ExpansionTile(
                    leading: Icon(Icons.person),
                    title: Text(passageiro.nome),
                    children: <Widget>[
                      ListTile(
                        title: Text('Detalhes do Passageiro'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Nome: ${passageiro.nome}'),
                            Text('Telefone: ${passageiro.telefone}'),
                            Text('Endereço: Rua ${passageiro.enderecoCasa.rua}, ${passageiro.enderecoCasa.numero}, ${passageiro.enderecoCasa.bairro}')
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
