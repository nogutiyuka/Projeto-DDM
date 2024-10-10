import 'package:app_motorista/app/banco/sqlite/conexao.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

main()async{
  setUpAll((){
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    
  });

  test('Teste classe conexao', () async {
    var db = await Conexao.iniciar();
    expect(db.isOpen, true);
    await db.close();
  });
}