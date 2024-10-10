import 'package:app_motorista/app/dominio/dto/dominio/dtoCidade.dart';
import 'package:app_motorista/app/dominio/estado.dart';
import 'package:app_motorista/app/dominio/interface/IDAOCidade.dart';

class Cidade {
  late String nome;
  late Estado estado;
  late dynamic? id;
  late DTOCidade dtoCidade;
  IDAOCidade dao;

  Cidade({required this.dao});

  Future<DTOCidade> salvar(DTOCidade dto) async {
    return dao.salvar(dto);
  }

  Future<List<DTOCidade>> buscarTodos() async {
    return dao.buscarTodos();
  }

  Future<DTOCidade> alterar(DTOCidade dto) async {
    return dao.alterar(dto);
  }

  void deletarPorID(id) async {
    dao.deletarPorID(id);
  }
}
