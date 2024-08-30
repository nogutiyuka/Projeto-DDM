import 'package:app_motorista/dominio/endereco/endereco.dart';
class Cliente{
  late String nome;
  late String telefone;
  late Endereco enderecoCasa;
  late dynamic id;
  late String apelido;

  Cliente({required this.nome, required this.telefone, required this.enderecoCasa, this.id, required this.apelido});

}