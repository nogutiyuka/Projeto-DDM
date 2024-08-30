class Motorista{
  late String nome;
  late String telefone;
  late String senha;
  late dynamic id;
  late String email;

  Motorista({required this.nome, required this.telefone, required this.senha, this.id, required this.email}){
    eNomeVazio();
    eTelefoneVazio();
    eSenhaVazia();
    eEmailVazio();
  }
  
  eNomeVazio(){
    if(nome.isEmpty || nome == ' ') throw Exception('Nome não pode ser vazio.');
  }

  eTelefoneVazio(){
    if(telefone.isEmpty || telefone == ' ') throw Exception('Telefone não pode ser vazio');
  }

  eSenhaVazia(){
    if(senha.isEmpty || senha == ' ') throw Exception('Senha não pode ser vazia');
  }

  eEmailVazio(){
    if(email.isEmpty || email == ' ') throw Exception('Email não pode ser vazio');
  }
}