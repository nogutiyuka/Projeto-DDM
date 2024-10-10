import 'package:app_motorista/app/dominio/dto/dominio/dtoCidade.dart';

abstract class IDAOCidade{
  Future<DTOCidade>salvar(DTOCidade dto);
  Future<List<DTOCidade>> buscarTodos();
  Future<DTOCidade> alterar(DTOCidade dto);
  void deletarPorID(dynamic id);
  
}