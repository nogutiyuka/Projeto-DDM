import 'package:app_motorista/app/dominio/dao/dao_estado_impl.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoEstado.dart';
import 'package:app_motorista/app/dominio/estado.dart';

class ApEstado {
  late DaoEstadoImpl dao;
  late Estado estado;

  ApEstado(){
    dao = DaoEstadoImpl();
    estado = Estado(dao: dao);
  }

    Future<DTOEstado> salvar(DTOEstado dto) async {
    return await estado.salvar(dto);
  }

  Future<List<DTOEstado>> buscarTodos() async {
    return await estado.buscarTodos();
  }

  Future<List<DTOEstado>> buscarPorId() async {
    return await estado.buscarPorId();
  }

  Future<DTOEstado> alterar(DTOEstado dto) async {
    return await estado.alterar(dto);
  }

  void deletarPorID(id) async {
    estado.deletarPorID(id);
  }

}