import 'package:app_motorista/app/dominio/dto/dominio/dtoEndereco.dart';

class DtoPassageiro {
  late String nome;
  late String telefone;
  late DTOEndereco enderecoCasa;
  late dynamic id;
  late String? apelido;

  DtoPassageiro({this.id, required this.nome, required this.telefone, required this.enderecoCasa, this.apelido});
}
