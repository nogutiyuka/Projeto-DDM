import 'package:app_motorista/app/dominio/dto/dominio/dtoEndereco.dart';
import 'package:app_motorista/app/dominio/cidade.dart';
import 'package:app_motorista/app/dominio/interface/IDAOEndereco.dart';

class Endereco {
  late String rua;
  late Cidade cidade;
  late int numero;
  late String bairro;
  late String? apelidoEndereco;
  late DTOEndereco dto;
  IDAOEndereco dao;

  Endereco({required this.dao});

  Future<DTOEndereco> salvar(DTOEndereco dto) async {
    return dao.salvar(dto);
  }

  Future<List<DTOEndereco>> buscarTodos() async {
    return dao.buscarTodos();
  }

  Future<DTOEndereco> alterar(DTOEndereco dto) async {
    return dao.alterar(dto);
  }

  void deletarPorID(id) async {
    dao.deletarPorID(id);
  }
}
