import 'package:app_motorista/app/dominio/dto/dominio/dtoMotorista.dart';
import 'package:app_motorista/app/dominio/interface/IDAOMotorista.dart';

class Motorista{
  late String nome;
  late String telefone;
  late String senha;
  late int id;
  late String email;
  late DtoMotorista dto;
  IDAOMotorista dao;

  Motorista({required this.dao});
  
  Future<DtoMotorista> salvar(DtoMotorista dto) async {
    return dao.salvar(dto);
  }

  Future<List<DtoMotorista>> buscarTodos() async {
    return dao.buscarTodos();
  }

  Future<DtoMotorista> alterar(DtoMotorista dto) async {
    return dao.alterar(dto);
  }
  void deletarPorID(id) async {
    dao.deletarPorID(id);
  }
}