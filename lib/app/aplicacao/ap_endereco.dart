
import 'package:app_motorista/app/dominio/dao/dao_endereco_impl.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoEndereco.dart';
import 'package:app_motorista/app/dominio/endereco.dart';

class ApEndereco {
  late DaoEnderecoImpl dao;
  late Endereco endereco;

  ApEndereco(){
    dao = DaoEnderecoImpl();
    endereco = Endereco(dao: dao);
  }

    Future<DTOEndereco> salvar(DTOEndereco dto) async {
    return await endereco.salvar(dto);
  }

  Future<List<DTOEndereco>> buscarTodos() async {
    return await endereco.buscarTodos();
  }

  Future<DTOEndereco> alterar(DTOEndereco dto) async {
    return await endereco.alterar(dto);
  }

  void deletarPorID(id) async {
    endereco.deletarPorID(id);
  }

}