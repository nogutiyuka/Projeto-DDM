import 'package:flutter_test/flutter_test.dart';
import 'package:app_motorista/dominio/motorista.dart';

void main() {
  group('Testes motorista', () {
    test('Teste do nome vazio', () {
      final motorista = Motorista(id: 1, nome: '', telefone: '123456789', email: 'email@example.com', senha: 'senha123');
      expect(motorista.eNomeVazio(), returnsNormally);
    });

    test('Teste do nome não vazio', () {
      final motorista = Motorista(id: 2, nome: 'João', telefone: '123456789', email: 'email@example.com', senha: 'senha123');
      expect(motorista.eNomeVazio(), returnsNormally);
    });

    test('Teste telefone vazio', () {
      final motorista = Motorista(id: 3, nome: 'João', telefone: '', email: 'email@example.com', senha: 'senha123');
      expect(motorista.eTelefoneVazio(), throwsException);
    });

    test('Teste telefone não vazio', () {
      final motorista = Motorista(id: 4, nome: 'João', telefone: '123456789', email: 'email@example.com', senha: 'senha123');
      expect(motorista.eTelefoneVazio(), returnsNormally);
    });

    test('Teste senha vazia', () {
      final motorista = Motorista(id: 5, nome: 'João', telefone: '123456789', email: 'email@example.com', senha: '');
      expect(motorista.eSenhaVazia(), throwsException);
    });

    test('Teste senha não vazia', () {
      final motorista = Motorista(id: 6, nome: 'João', telefone: '123456789', email: 'email@example.com', senha: 'senha123');
      expect(motorista.eSenhaVazia(), returnsNormally);
    });

    test('Teste email vazio', () {
      final motorista = Motorista(id: 7, nome: 'João', telefone: '123456789', email: '', senha: 'senha123');
      expect(motorista.eEmailVazio(), throwsException);
    });

    test('eEmailVazio should return false when email is not empty', () {
      final motorista = Motorista(id: 8, nome: 'João', telefone: '123456789', email: 'email@example.com', senha: 'senha123');
      expect(motorista.eEmailVazio(), returnsNormally);
    });
  });
}
