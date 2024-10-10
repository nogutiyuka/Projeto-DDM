import 'package:app_motorista/app/dominio/dao/dao_passageiro_impl.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dto_passageiro.dart';
import 'package:app_motorista/app/dominio/passageiro.dart';

class ApPassageiro {
  late DaoPassageiroImpl dao;
  late Passageiro passageiro;

  ApPassageiro() {
    dao = DaoPassageiroImpl();
    passageiro = Passageiro(dao: dao);
  }

  Future<DtoPassageiro> salvar(DtoPassageiro dto) async {
    return await passageiro.salvar(dto);
  }

  Future<List<DtoPassageiro>> buscarTodos() async {
    return await passageiro.buscarTodos();
  }

  Future<DtoPassageiro> alterar(DtoPassageiro dto) async {
    return await passageiro.alterar(dto);
  }

  void deletarPorID(id) async {
    passageiro.deletarPorID(id);
  }
}
