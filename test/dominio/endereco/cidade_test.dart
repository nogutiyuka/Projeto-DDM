import 'package:flutter_test/flutter_test.dart';
import 'package:app_motorista/dominio//endereco/cidade.dart';

void main() {
  group('Testes Cidade', () {
    test('Teste de nome de cidade vazio', () {
      expect(() => Cidade(nome: ''), throwsException);
    });
    test('Teste de nome de cidade não vazio', () {
      expect(() => Cidade(nome: 'Paranavaí'), returnsNormally);
    });
  });
}
