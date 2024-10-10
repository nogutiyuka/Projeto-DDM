import 'package:app_motorista/app/banco/sqlite/conexao.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoEndereco.dart';
import 'package:app_motorista/app/dominio/interface/IDAOEndereco.dart';
import 'package:sqflite/sqflite.dart';

class DaoEnderecoImpl implements IDAOEndereco {
  late Database database;
  final String salvarSql = '''
  INSERT INTO cidade (rua, cidade, numero, bairro, apelido_endereco)
    VALUES (?, ?, ?, ?, ?)
  ''';

  final String listarSql = '''
  SELECT * FROM endereco;
  ''';

  final String alterarSql = '''
  UPDATE endereco SET rua = ?, cidade = ?, numero = ?, bairro = ?, apelido_endereco = ?;
  ''';

  final String deletarSql = '''
  DELETE FROM endereco WHERE id = ?;
  ''';

  @override
  Future<DTOEndereco> salvar(DTOEndereco dto) async {
    database = await Conexao.iniciar();
    int id = await database.rawInsert(salvarSql, [
      dto.rua, 
      dto.cidade,
      dto.numero,
      dto.bairro,
      dto.apelidoEndereco]);
    dto.id = id;
    return dto;
  }

  @override
  Future<List<DTOEndereco>> buscarTodos() async {
    database = await Conexao.iniciar();
    return database.rawQuery(listarSql).then((value) {
      return value
          .map((e) => DTOEndereco(
              id: e['id'],
              rua: e['nome'] as String,
              cidade: e['estado'] as dynamic,
              numero: int.parse(e['numero'].toString()),
              bairro: e['bairro'] as String,
              apelidoEndereco: e["apelidoEndereco"] as String))
          .toList();
    });
  }

  @override
  Future<DTOEndereco> alterar(DTOEndereco dto) async {
    database = await Conexao.iniciar();
    int id = await database.rawUpdate(alterarSql, [dto.rua, dto.cidade, dto.numero, dto.bairro, dto.apelidoEndereco]);
    dto.id = id;
    return dto;
  }

  @override
  void deletarPorID(id) async {
    database = await Conexao.iniciar();
    database.rawDelete(deletarSql, [id]);
  }
}