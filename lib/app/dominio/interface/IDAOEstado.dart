import 'package:app_motorista/app/dominio/dto/dominio/dtoEstado.dart';

abstract class IDAOEstado{
  Future<DTOEstado>salvar(DTOEstado dto);
  Future<List<DTOEstado>> buscarTodos();
  Future<DTOEstado> alterar(DTOEstado dto);
  void deletarPorID(dynamic id);
}