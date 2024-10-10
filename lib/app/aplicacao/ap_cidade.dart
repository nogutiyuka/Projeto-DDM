import 'package:app_motorista/app/dominio/dao/dao_cidade_impl.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoCidade.dart';
import 'package:app_motorista/app/dominio/cidade.dart';

class ApCidade {
  late DaoCidadeImpl dao;
  late Cidade cidade;

  ApCidade(){
    dao = DaoCidadeImpl();
    cidade = Cidade(dao: dao);
  }

    Future<DTOCidade> salvar(DTOCidade dto) async {
    return await cidade.salvar(dto);
  }

  Future<List<DTOCidade>> buscarTodos() async {
    return await cidade.buscarTodos();
  }

  Future<DTOCidade> alterar(DTOCidade dto) async {
    return await cidade.alterar(dto);
  }

  void deletarPorID(id) async {
    cidade.deletarPorID(id);
  }

}