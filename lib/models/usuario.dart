class Usuario {
  final int id;
  final String usuario;
  final String senha;
  final String fantasia;
  final String email;

  Usuario({this.id, this.usuario, this.senha, this.fantasia, this.email});

  get getUsuario => this.usuario;
  get getSenha => this.senha;
  get getEmail => this.email;
  get getFantasia => this.fantasia;

  factory Usuario.fromJson() {
    return Usuario(
        id: 0,
        usuario: 'user',
        senha: 'pass',
        fantasia: 'Teste',
        email: 'teste@gmail.com');
  }
}
