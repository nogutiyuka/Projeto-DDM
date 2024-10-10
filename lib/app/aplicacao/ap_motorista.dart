import 'package:app_motorista/app/dominio/dao/dao_motorista.impl.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoMotorista.dart';
import 'package:app_motorista/app/dominio/motorista.dart';

class ApMotorista {
  late DaoMotoristaImpl dao;
  late Motorista motorista;

  ApMotorista(){
    dao = DaoMotoristaImpl();
    motorista = Motorista(dao: dao);
  }

    Future<DtoMotorista> salvar(DtoMotorista dto) async {
    return await motorista.salvar(dto);
  }

  Future<List<DtoMotorista>> buscarTodos() async {
    return await motorista.buscarTodos();
  }

  Future<DtoMotorista> alterar(DtoMotorista dto) async {
    return await motorista.alterar(dto);
  }

  void deletarPorID(id) async {
    motorista.deletarPorID(id);
  }
}