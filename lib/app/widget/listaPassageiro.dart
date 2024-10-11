import 'package:app_motorista/app/aplicacao/ap_cidade.dart';
import 'package:app_motorista/app/aplicacao/ap_endereco.dart';
import 'package:app_motorista/app/aplicacao/ap_estado.dart';
import 'package:app_motorista/app/aplicacao/ap_passageiro.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoCidade.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoEndereco.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoEstado.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dto_passageiro.dart';
import 'package:flutter/material.dart';

class ListaPassageiro extends StatelessWidget {
  const ListaPassageiro({super.key});

  Future<List<DtoPassageiro>> consultar() async {
    DTOEstado dtoEstado = DTOEstado(nome: 'Paraná', sigla: 'PR');
    ApEstado apEstado = ApEstado();
    await apEstado.salvar(dtoEstado);

    DTOCidade dtoCidade = DTOCidade(nome: 'Paranavaí', estado: dtoEstado.id);
    ApCidade apCidade = ApCidade();
    await apCidade.salvar(dtoCidade);

    DTOEndereco dtoEndereco = DTOEndereco(
        rua: 'Luiz Lorenzett',
        numero: 1526,
        cidade: dtoCidade.id,
        bairro: 'Jardim Prudente');
    ApEndereco apEndereco = ApEndereco();
    await apEndereco.salvar(dtoEndereco);

    DtoPassageiro dtoPassageiro = DtoPassageiro(
        nome: 'Rogério Luiz',
        telefone: '44988885562',
        enderecoCasa: dtoEndereco.id);
    ApPassageiro apPassageiro = ApPassageiro();
    await apPassageiro.salvar(dtoPassageiro);

    return await apPassageiro.buscarTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Clientes'),
      ), //appBar
      body: FutureBuilder(
          future: consultar(),
          builder: (BuildContext context,
              AsyncSnapshot<List<DtoPassageiro>> consulta) {
            var dados = consulta.data;
            if (dados == null) {
              return Text('Dados não encontrados.');
            } else {
              List<DtoPassageiro> lista = dados;
              return ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  var clientes = lista[index];
                  return ListTile(
                    leading: Icon(Icons.person),
                    title: Text(clientes.nome),
                    subtitle: Text(clientes.enderecoCasa.rua),
                  );
                },
              );
            }
          }),
    );
  }
}
