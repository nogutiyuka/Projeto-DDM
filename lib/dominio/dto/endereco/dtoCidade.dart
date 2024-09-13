import 'package:app_motorista/dominio/dto/endereco/dtoEstado.dart';

class DTOCidade{
  late dynamic? id;
  late String nome;
  late DTOEstado estado;

  DTOCidade({this.id, required this.nome, required this.estado});
}