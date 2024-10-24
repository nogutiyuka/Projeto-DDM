import 'package:app_motorista/app/dominio/dto/dominio/dtoMotorista.dart';

abstract class IDAOMotorista{
  Future<DtoMotorista>salvar(DtoMotorista dto);
  Future<List<DtoMotorista>> buscarTodos();
  Future<DtoMotorista> alterar(DtoMotorista dto);
  void deletarPorID(int id);
}