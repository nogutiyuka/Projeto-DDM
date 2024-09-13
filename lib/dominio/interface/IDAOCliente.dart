import 'package:app_motorista/dominio/dto/dominio/dto_cliente.dart';

abstract class IDAOCliente{


  Future<DtoCliente>salvar(DtoCliente dto);
}