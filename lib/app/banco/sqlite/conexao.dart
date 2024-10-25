import 'package:app_motorista/app/banco/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Conexao {
  static late Database _db;

  static Future<Database> iniciar() async {
    var path = join(await getDatabasesPath(), 'banco.db');
    //await deleteDatabase(path);
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        criarTabelas.forEach(db.execute);
        inserirDados.forEach(db.execute);
      },
      singleInstance: true
    );
    return _db;
    }
}