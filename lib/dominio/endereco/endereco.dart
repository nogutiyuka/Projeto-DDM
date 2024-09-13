import 'package:app_motorista/dominio/dto/endereco/dtoEndereco.dart';
import 'package:app_motorista/dominio/endereco/cidade.dart';

class Endereco {
  late String rua;
  late Cidade cidade;
  late int numero;
  late String bairro;
  late String? apelidoEndereco;
  late DTOEndereco dtoEndereco;

  Endereco({required this.rua, required this.cidade, required this.numero, required this.bairro, this.apelidoEndereco});
}
