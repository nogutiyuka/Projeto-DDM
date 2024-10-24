class DtoMotorista {
  late String nome;
  late String telefone;
  late String senha;
  late int? id;
  late String email;

  DtoMotorista(
      {this.id,
      required this.nome,
      required this.telefone,
      required this.senha,
      required this.email});
}
