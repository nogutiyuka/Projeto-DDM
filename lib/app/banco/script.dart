const criarTabelas = [
  '''
    CREATE TABLE estado(
      id INTEGER NOT NULL PRIMARY KEY
      ,nome VARCHAR(200) NOT NULL
      ,sigla CHAR(2) NOT NULL
    )
  ''',
  '''
      CREATE TABLE cidade(
      id INTEGER NOT NULL PRIMARY KEY
      ,nome VARCHAR(200) NOT NULL
      ,id_estado INTEGER NOT NULL, FOREIGN KEY(id_estado) REFERENCES estado(id) ON DELETE CASCADE
    )
  ''',
  '''
      CREATE TABLE endereco(
      id INTEGER NOT NULL PRIMARY KEY
      ,rua VARCHAR(200) NOT NULL
      ,numero CHAR(5) NOT NULL
      ,bairro VARCHAR(250) NOT NULL
      ,apelido VARCHAR(250)
      ,id_cidade INTEGER NOT NULL, FOREIGN KEY(id_cidade) REFERENCES cidade(id) ON DELETE CASCADE
    )
  ''',
  '''
      CREATE TABLE passageiro(
      id INTEGER NOT NULL PRIMARY KEY
      ,nome VARCHAR(200) NOT NULL
      ,telefone CHAR(14) NOT NULL
      ,apelido VARCHAR(250)
      ,id_endereco INTEGER NOT NULL, FOREIGN KEY(id_endereco) REFERENCES endereco(id) ON DELETE CASCADE
    )
  '''
  '''
      CREATE TABLE motorista(
      id INTEGER NOT NULL PRIMARY KEY
      ,nome VARCHAR(200) NOT NULL
      ,telefone CHAR(14) NOT NULL
      ,senha VARCHAR(50) NOT NULL
      ,email VARCHAR(50) NOT NULL
    )
  '''
];