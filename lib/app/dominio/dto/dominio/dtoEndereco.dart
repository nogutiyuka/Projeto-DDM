import 'package:app_motorista/app/dominio/dto/dominio/dtoCidade.dart';

class DTOEndereco{
  late dynamic? id;
  late String rua;
  late int numero;
  late String bairro;
  late String? apelidoEndereco;
  late dynamic cidade;

  DTOEndereco({this.id, required this.rua, required this.numero, required this.cidade, required this.bairro, this.apelidoEndereco});
}