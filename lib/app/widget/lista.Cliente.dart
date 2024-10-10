import 'package:app_motorista/app/dominio/dto/dominio/dto_passageiro.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoCidade.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoEndereco.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoEstado.dart';
import 'package:flutter/material.dart';

class ListaCliente extends StatelessWidget{
  Future<List<DtoPassageiro>> consultar() async {
    return [
      DtoPassageiro(
          nome: 'Roger Silva', 
          telefone: '(44)99999-9999', 
          enderecoCasa: 
            DTOEndereco(
              rua: 'Luiz Camargo', 
              numero: 1456, 
              cidade: 
                DTOCidade(
                  nome: 'Paranavaí', 
                  estado: 
                  DTOEstado(
                    nome: 'Paraná', 
                    sigla: 'PR')), 
            bairro: 'Jardim Progresso')),
      DtoPassageiro(
          nome: 'Karen Albuquerque', 
          telefone: '(44)99999-9999', 
          enderecoCasa: 
          DTOEndereco(
            rua: 'Avenida Paraná', 
            numero: 1456, 
            cidade: 
              DTOCidade(
                nome: 'Paranavaí', 
                estado: 
                  DTOEstado(
                    nome: 'Paraná', 
                    sigla: 'PR')), 
            bairro: 'Jardim Progresso')),
      DtoPassageiro(
        nome: 'Florisvaldo Calango', 
        telefone: '(44)99999-9999', 
        enderecoCasa: 
          DTOEndereco(
            rua: 'Geraldo Magela', 
            numero: 1456, 
            cidade:  
              DTOCidade(
                nome: 'Paranavaí', 
                estado: 
                  DTOEstado(
                    nome: 'Paraná', 
                    sigla: 'PR')), 
          bairro: 'Jardim Progresso'))
        ];
  }

  const ListaCliente({super.key});

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