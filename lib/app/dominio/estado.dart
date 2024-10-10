import 'package:app_motorista/app/dominio/dto/dominio/dtoEstado.dart';
import 'package:app_motorista/app/dominio/interface/IDAOEstado.dart';

class Estado{
  late dynamic? id;
  late String nome;
  late String sigla;
  late DTOEstado dtoEstado;
  IDAOEstado dao;

  Estado({required this.dao});

  Future<DTOEstado> salvar(DTOEstado dto) async {
    return dao.salvar(dto);
  }

  Future<List<DTOEstado>> buscarTodos() async {
    return dao.buscarTodos();
  }

  Future<DTOEstado> alterar(DTOEstado dto) async {
    return dao.alterar(dto);
  }

  void deletarPorID(id) async {
    dao.deletarPorID(id);
  }
}