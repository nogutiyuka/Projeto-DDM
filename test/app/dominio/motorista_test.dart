import 'package:flutter_test/flutter_test.dart';
import 'package:app_motorista/app/dominio/motorista.dart';

void main() {
  group('Testes motorista', () {
    test('Teste do nome vazio', () {
      expect(() => Motorista(id: 1, nome: '', telefone: '123456789', email: 'email@example.com', senha: 'senha123'), throwsException);
    });

    test('Teste do nome não vazio', () {
      expect(() => Motorista(id: 2, nome: 'João', telefone: '123456789', email: 'email@example.com', senha: 'senha123'), returnsNormally);
    });

    test('Teste telefone vazio', () {
      expect(() => Motorista(id: 3, nome: 'João', telefone: '', email: 'email@example.com', senha: 'senha123'), throwsException);
    });

    test('Teste telefone não vazio', () {
      expect(() => Motorista(id: 4, nome: 'João', telefone: '123456789', email: 'email@example.com', senha: 'senha123'), returnsNormally);
    });

    test('Teste senha vazia', () {
      expect(() => Motorista(id: 5, nome: 'João', telefone: '123456789', email: 'email@example.com', senha: ''), throwsException);
    });

    test('Teste senha não vazia', () {
      expect(() => Motorista(id: 6, nome: 'João', telefone: '123456789', email: 'email@example.com', senha: 'senha123'), returnsNormally);
    });

    test('Teste email vazio', () {
      expect(() => Motorista(id: 7, nome: 'João', telefone: '123456789', email: '', senha: 'senha123'), throwsException);
    });

    test('eEmailVazio should return false when email is not empty', () {
      expect(() => Motorista(id: 8, nome: 'João', telefone: '123456789', email: 'email@example.com', senha: 'senha123'), returnsNormally);
    });
  });
}
