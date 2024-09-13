import 'package:app_motorista/dominio/dto/endereco/dtoCidade.dart';

class DTOEndereco{
  late dynamic? id;
  late String rua;
  late String numero;
  late String bairro;
  late String? apelidoEndereco;
  late DTOCidade cidade;

  DTOEndereco({this.id, required this.rua, required this.numero, required this.cidade, required this.bairro, this.apelidoEndereco});
}