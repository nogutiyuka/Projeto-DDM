import 'package:app_motorista/app/banco/sqlite/conexao.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoCidade.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoEndereco.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoEstado.dart';
import 'package:app_motorista/app/dominio/interface/IDAOEndereco.dart';
import 'package:sqflite/sqflite.dart';

class DaoEnderecoImpl implements IDAOEndereco {
  late Database database;
  final String salvarSql = '''
  INSERT INTO endereco (rua, id_cidade, numero, bairro, apelido)
    VALUES (?, ?, ?, ?, ?)
  ''';

  final String listarSql = '''
  SELECT endereco.id, endereco.rua, endereco.numero, endereco.bairro, endereco.apelido, 
  cidade.id AS id_cidade, cidade.nome AS cidade_nome, estado.id AS id_estado, estado.nome AS estado_nome, estado.sigla AS estado_sigla
  FROM endereco
  JOIN cidade ON endereco.id_cidade = cidade.id
  JOIN estado ON cidade.id_estado = estado.id;
''';

  final String alterarSql = '''
  UPDATE endereco SET rua = ?, id_cidade = ?, numero = ?, bairro = ?, apelido = ?;
  ''';

  final String deletarSql = '''
  DELETE FROM endereco WHERE id = ?;
  ''';

  @override
  Future<DTOEndereco> salvar(DTOEndereco dto) async {
    database = await Conexao.iniciar();
    int id = await database.rawInsert(salvarSql,
        [dto.rua, dto.cidade, dto.numero, dto.bairro, dto.apelidoEndereco]);
    dto.id = id;
    return dto;
  }

  @override
  Future<List<DTOEndereco>> buscarTodos() async {
    database = await Conexao.iniciar();
    print("Buscando os dados de endereço");
    return database.rawQuery(listarSql).then((value) {
      return value.map((e) {
        return DTOEndereco(
          id: e['id'] as dynamic,
          rua: e['rua'] as String,
          numero: int.parse(e['numero'].toString()),
          bairro: e['bairro'] as String,
          apelidoEndereco: (e['apelido'] ?? '') as String,
          cidade: DTOCidade(
            id: e['id_cidade'] as dynamic,
            nome: e['cidade_nome'] as String, // Usando o alias correto
            estado: DTOEstado(
              id: e['id_estado'] as dynamic,
              nome: e['estado_nome'] as String,
              sigla: e['estado_sigla'] as String,
            ),
          ),
        );
      }).toList();
    });
  }

  @override
  Future<DTOEndereco> alterar(DTOEndereco dto) async {
    database = await Conexao.iniciar();
    int id = await database.rawUpdate(alterarSql,
        [dto.rua, dto.cidade, dto.numero, dto.bairro, dto.apelidoEndereco]);
    dto.id = id;
    return dto;
  }

  @override
  void deletarPorID(id) async {
    database = await Conexao.iniciar();
    database.rawDelete(deletarSql, [id]);
  }
}
