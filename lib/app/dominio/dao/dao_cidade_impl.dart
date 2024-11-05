import 'package:app_motorista/app/banco/sqlite/conexao.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoCidade.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoEstado.dart';
import 'package:app_motorista/app/dominio/interface/IDAOCidade.dart';
import 'package:sqflite/sqflite.dart';

class DaoCidadeImpl implements IDAOCidade {
  late Database database;
  final String salvarSql = '''
  INSERT INTO cidade (nome, id_estado)
    VALUES (?, ?)
  ''';

  final String listarSql = '''
  SELECT cidade.id, cidade.nome, estado.nome AS estado_nome, estado.sigla AS estado_sigla
  FROM cidade
  JOIN estado ON cidade.id_estado = estado.id;
''';

  final String alterarSql = '''
  UPDATE cidade SET nome = ?, id_estado = ? WHERE id = ?;
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
    return value.map((e) {
      return DTOCidade(
        id: e['id'] as dynamic,
        nome: e['nome'] as String,
        estado: DTOEstado (
          id: e['id_estado'] as dynamic,
          nome: e['estado_nome'] as String,
          sigla: e['estado_sigla'] as String,
        ),
      );
    }).toList();
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
