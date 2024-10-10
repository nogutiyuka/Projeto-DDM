import 'package:app_motorista/app/dominio/dto/dominio/dtoEndereco.dart';

abstract class IDAOEndereco{
  Future<DTOEndereco>salvar(DTOEndereco dto);
  Future<List<DTOEndereco>> buscarTodos();
  Future<DTOEndereco> alterar(DTOEndereco dto);
  void  deletarPorID(dynamic id);
}