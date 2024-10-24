
import 'package:app_motorista/app/dominio/endereco.dart';

class DtoPassageiro {
  late String nome;
  late String telefone;
  late Endereco enderecoCasa;
  late dynamic id;
  late String? apelido;

  DtoPassageiro({this.id, required this.nome, required this.telefone, required this.enderecoCasa, this.apelido});
}