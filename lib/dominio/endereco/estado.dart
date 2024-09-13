import 'package:app_motorista/dominio/dto/endereco/dtoEstado.dart';

class Estado{
  late dynamic? id;
  late String nome;
  late String sigla;
  late DTOEstado dtoEstado;

  Estado({required this.nome, required this.sigla});
}