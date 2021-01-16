class Character {
  final int id;
  final String nome;
  final String descricao;

  Character({this.id, this.nome, this.descricao});

  get getId => this.id;
  get getNome => this.nome;
  get getDescricao => this.descricao;

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
        id: json['id'],
        nome: json['name'].toString(),
        descricao: json['description'].toString());
  }
}
