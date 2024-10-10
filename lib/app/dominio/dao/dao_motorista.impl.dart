import 'package:app_motorista/app/banco/sqlite/conexao.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoMotorista.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dto_passageiro.dart';
import 'package:app_motorista/app/dominio/interface/IDAOMotorista.dart';
import 'package:sqflite/sqflite.dart';

class DaoMotoristaImpl implements IDAOMotorista {
  late Database database;
  final String salvarSql = '''
  INSERT INTO motorista (nome, telefone, senha, email)
    VALUES (?, ?, ?, ?)
  ''';

  final String listarSql = '''
  SELECT * FROM motorista;
  ''';

  final String alterarSql = '''
  UPDATE motorista SET nome = ?, telefone = ?, senha = ?, email = ? WHERE id = ?;
  ''';

  final String deletarSql = '''
  DELETE FROM motorista WHERE id = ?;
  ''';

  @override
  Future<DtoMotorista> salvar(DtoMotorista dto) async {
    database = await Conexao.iniciar();
    int id = await database.rawInsert(
        salvarSql, [dto.nome, dto.telefone, dto.senha, dto.email]);
    dto.id = id;
    return dto;
  }

  @override
  Future<List<DtoMotorista>> buscarTodos() async {
    database = await Conexao.iniciar();
    return database.rawQuery(listarSql).then((value) {
      return value
          .map((e) => DtoMotorista(
              id: e['id'],
              nome: e['nome'] as String,
              telefone: e['estado'] as String,
              senha: e['endereco_casa'] as dynamic,
              email: e['apelido'] as String))
          .toList();
    });
  }

  @override
  Future<DtoMotorista> alterar(DtoMotorista dto) async {
    database = await Conexao.iniciar();
    int id = await database.rawUpdate(
        alterarSql, [dto.nome, dto.telefone, dto.senha, dto.email]);
    dto.id = id;
    return dto;
  }

  @override
  void deletarPorID(id) async {
    database = await Conexao.iniciar();
    database.rawDelete(deletarSql, [id]);
  }
}
