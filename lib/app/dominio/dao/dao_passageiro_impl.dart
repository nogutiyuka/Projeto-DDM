import 'package:app_motorista/app/banco/sqlite/conexao.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoCidade.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoEndereco.dart';
import 'package:app_motorista/app/dominio/dto/dominio/dtoEstado.dart';
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
  SELECT passageiro.nome, passageiro.telefone, passageiro.apelido, 
  endereco.id AS id_endereco, endereco.rua AS endereco_rua, endereco.numero AS endereco_numero, 
  endereco.bairro AS endereco_bairro, endereco.apelido AS endereco_apelido,
  cidade.id AS id_cidade, cidade.nome AS cidade_nome, estado.id AS id_estado,
  estado.nome AS estado_nome, estado.sigla AS estado_sigla
  FROM passageiro
  JOIN endereco ON passageiro.id_endereco = endereco.id
  JOIN cidade ON endereco.id_cidade = cidade.id
  JOIN estado ON cidade.id_estado = estado.id;
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
  print('Buscando todos os passageiros...');

  return database.rawQuery(listarSql).then((value) {
    return value.map((e) {
      return DtoPassageiro(
        nome: e['nome'] as String,
        telefone: e['telefone'] as String,
        apelido: (e['apelido'] ?? '') as String,
        enderecoCasa: DTOEndereco(
          id: e['id_endereco'] as dynamic,
          rua: e['endereco_rua'] as String,
          numero: int.parse(e['endereco_numero'].toString()),
          bairro: e['endereco_bairro'] as String,
          apelidoEndereco: (e['endereco_apelido'] ?? '') as String,
          cidade: DTOCidade(
            id: e['id_cidade'] as dynamic,
            nome: e['cidade_nome'] as String,
            estado: DTOEstado(
              id: e['id_estado'] as dynamic,
              nome: e['estado_nome'] as String,
              sigla: e['estado_sigla'] as String,
            ),
          ),
        ),
      );
    }).toList();
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
