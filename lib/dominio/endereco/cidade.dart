class Cidade {
  late String nome;

  Cidade({required this.nome}){
    eNomeVazio();
  }

  void eNomeVazio() {
    if (nome.isEmpty) throw Exception('Nome da cidade não pode ser vazio.');
  }
}
