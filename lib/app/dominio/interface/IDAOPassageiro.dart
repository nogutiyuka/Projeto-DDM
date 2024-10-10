import 'package:app_motorista/app/dominio/dto/dominio/dto_passageiro.dart';

abstract class IDAOPassageiro{
  Future<DtoPassageiro>salvar(DtoPassageiro dto);
  Future<List<DtoPassageiro>> buscarTodos();
  Future<DtoPassageiro> alterar(DtoPassageiro dto);
  void deletarPorID(dynamic id);
}