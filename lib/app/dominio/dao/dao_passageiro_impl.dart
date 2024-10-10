import 'package:app_motorista/app/banco/sqlite/conexao.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dto_passageiro.dart';
import 'package:app_motorista/app/dominio/interface/IDAOPassageiro.dart';
import 'package:sqflite/sqflite.dart';

class DaoPassageiroImpl implements IDAOPassageiro {
  late Database database;
  final String salvarSql = '''
  INSERT INTO passageiro (nome, telefone, endereco_casa, apelido)
    VALUES (?, ?, ?, ?)
  ''';

  final String listarSql = '''
  SELECT * FROM passageiro;
  ''';

  final String alterarSql = '''
  UPDATE passageiro SET nome = ?, telefone = ?, endereco_casa = ?, apelido = ? WHERE id = ?;
  ''';

  final String deletarSql = '''
  DELETE FROM passageiro WHERE id = ?;
  ''';

  @override
  Future<DtoPassageiro> salvar(DtoPassageiro dto) async {
    database = await Conexao.iniciar();
    int id = await database.rawInsert(
        salvarSql, [dto.nome, dto.telefone, dto.enderecoCasa, dto.apelido]);
    dto.id = id;
    return dto;
  }

  @override
  Future<List<DtoPassageiro>> buscarTodos() async {
    database = await Conexao.iniciar();
    return database.rawQuery(listarSql).then((value) {
      return value
          .map((e) => DtoPassageiro(
              id: e['id'],
              nome: e['nome'] as String,
              telefone: e['estado'] as String,
              enderecoCasa: e['endereco_casa'] as dynamic,
              apelido: e['apelido'] as String))
          .toList();
    });
  }

  @override
  Future<DtoPassageiro> alterar(DtoPassageiro dto) async {
    database = await Conexao.iniciar();
    int id = await database.rawUpdate(
        alterarSql, [dto.nome, dto.telefone, dto.enderecoCasa, dto.apelido]);
    dto.id = id;
    return dto;
  }

  @override
  void deletarPorID(id) async {
    database = await Conexao.iniciar();
    database.rawDelete(deletarSql, [id]);
  }
}
