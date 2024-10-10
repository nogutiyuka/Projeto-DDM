import 'package:app_motorista/app/banco/sqlite/conexao.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoCidade.dart';
import 'package:app_motorista/app/dominio/interface/IDAOCidade.dart';
import 'package:sqflite/sqflite.dart';

class DaoCidadeImpl implements IDAOCidade {
  late Database database;
  final String salvarSql = '''
  INSERT INTO cidade (nome, estado)
    VALUES (?, ?)
  ''';

  final String listarSql = '''
  SELECT * FROM cidade;
  ''';

  final String alterarSql = '''
  UPDATE cidade SET nome = ?, estado = ? WHERE id = ?;
  ''';

  final String deletarSql = '''
  DELETE FROM cidade WHERE id = ?;
  ''';

  @override
  Future<DTOCidade> salvar(DTOCidade dto) async {
    database = await Conexao.iniciar();
    int id = await database.rawInsert(salvarSql, [dto.nome, dto.estado]);
    dto.id = id;
    return dto;
  }

  @override
  Future<List<DTOCidade>> buscarTodos() async {
    database = await Conexao.iniciar();
    return database.rawQuery(listarSql).then((value) {
      return value
          .map((e) => DTOCidade(
              id: e['id'],
              nome: e['nome'] as String,
              estado: e['estado'] as dynamic))
          .toList();
    });
  }

  @override
  Future<DTOCidade> alterar(DTOCidade dto) async {
    database = await Conexao.iniciar();
    int id = await database.rawUpdate(alterarSql, [dto.nome, dto.estado]);
    dto.id = id;
    return dto;
  }

  @override
  void deletarPorID(id) async {
    database = await Conexao.iniciar();
    database.rawDelete(deletarSql, [id]);
  }
}
