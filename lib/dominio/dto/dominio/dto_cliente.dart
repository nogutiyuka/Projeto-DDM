import 'package:app_motorista/dominio/dto/endereco/dtoEndereco.dart';

class DtoCliente {
  late String nome;
  late String telefone;
  late DTOEndereco enderecoCasa;
  late dynamic id;
  late String? apelido;

  DtoCliente({this.id, required this.nome, required this.telefone, required this.enderecoCasa, this.apelido});
}
