import 'package:app_motorista/app/banco/sqlite/conexao.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoEstado.dart';
import 'package:app_motorista/app/dominio/interface/IDAOEstado.dart';
import 'package:sqflite/sqflite.dart';

class DaoEstadoImpl implements IDAOEstado {
  late Database database;
  final String salvarSql = '''
  INSERT INTO estado (nome, sigla)
    VALUES (?, ?)
  ''';

  final String listarSql = '''
  SELECT * FROM estado;
  ''';

  final String alterarSql = '''
  UPDATE estado SET nome = ?, sigla = ? WHERE id = ?;
  ''';

  final String deletarSql = '''
  DELETE FROM estado WHERE id = ?;
  ''';
  final String listarPorId = '''
  SELECT * FROM estado WHERE id = ?;
''';

  @override
  Future<DTOEstado> salvar(DTOEstado dto) async {
    database = await Conexao.iniciar();
    int id = await database.rawInsert(salvarSql, [dto.nome, dto.sigla]);
    dto.id = id;
    return dto;
  }

  @override
  Future<List<DTOEstado>> buscarTodos() async {
    database = await Conexao.iniciar();
    print("buscando os dados de estado");
    return database.rawQuery(listarSql).then((value) {
      return value
          .map((e) => DTOEstado(
              id: e['id'],
              nome: e['nome'] as String,
              sigla: e['sigla'] as String))
          .toList();
    });
  }

    @override
  Future<List<DTOEstado>> buscarPorId() async {
    database = await Conexao.iniciar();
    print("buscando os dados de estado por Id");
    return database.rawQuery(listarPorId).then((value) {
      return value
          .map((e) => DTOEstado(
              id: e['id'],
              nome: e['nome'] as String,
              sigla: e['sigla'] as String))
          .toList();
    });
  }

  @override
  Future<DTOEstado> alterar(DTOEstado dto) async {
    database = await Conexao.iniciar();
    await database.rawUpdate(alterarSql, [dto.nome, dto.sigla, dto.id]);
    return dto;
  }

  @override
  void deletarPorID(id) async {
    database = await Conexao.iniciar();
    database.rawDelete(deletarSql, [id]);
  }
}
