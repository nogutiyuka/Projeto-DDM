import 'package:app_motorista/dominio/dto/endereco/dtoCidade.dart';
import 'package:app_motorista/dominio/endereco/estado.dart';

class Cidade {
  late String nome;
  late Estado estado;
  late dynamic? id;
  late DTOCidade dtoCidade;

  Cidade({required this.nome}){
    eNomeVazio();
  }

  void eNomeVazio() {
    if (nome.isEmpty) throw Exception('Nome da cidade não pode ser vazio.');
  }
}
