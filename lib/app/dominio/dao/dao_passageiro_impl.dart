import 'package:app_motorista/app/banco/sqlite/conexao.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dto_passageiro.dart';
import 'package:app_motorista/app/dominio/interface/IDAOPassageiro.dart';
import 'package:sqflite/sqflite.dart';

class DaoPassageiroImpl implements IDAOPassageiro {
  late Database database;
  final String salvarSql = '''
  INSERT INTO passageiro (nome, telefone, id_endereco, apelido)
    VALUES (?, ?, ?, ?)
  ''';

  final String listarSql = '''
  SELECT * FROM passageiro;
  ''';

  final String alterarSql = '''
  UPDATE passageiro SET nome = ?, telefone = ?, id_endereco = ?, apelido = ? WHERE id = ?;
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
    var resultado = await database.rawQuery(listarSql);
    List<DtoPassageiro> passageiros = List.generate(resultado.length, (i) {
        var linha = resultado[i];
        return DtoPassageiro(
              nome: linha['nome'].toString(),
              telefone: linha['estado'].toString(),
              enderecoCasa: linha['id_endereco'] as dynamic,
              apelido: linha['apelido'].toString());
    });
    return passageiros;
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