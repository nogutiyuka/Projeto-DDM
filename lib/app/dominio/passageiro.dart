import 'package:app_motorista/app/dominio/dto/dominio/dto_passageiro.dart';
import 'package:app_motorista/app/dominio/endereco.dart';
import 'package:app_motorista/app/dominio/interface/IDAOPassageiro.dart';

class Passageiro{
  late String nome;
  late String telefone;
  late Endereco enderecoCasa;
  late dynamic id;
  late String? apelido;
  late DtoPassageiro dto;
  IDAOPassageiro dao;

  Passageiro({required this.dao});
  
  Future<DtoPassageiro> salvar(DtoPassageiro dto) async {
    return dao.salvar(dto);
  }

  Future<List<DtoPassageiro>> buscarTodos() async {
    return dao.buscarTodos();
  }

  Future<DtoPassageiro> alterar(DtoPassageiro dto) async {
    return dao.alterar(dto);
  }
  void deletarPorID(id) async {
    dao.deletarPorID(id);
  }
}