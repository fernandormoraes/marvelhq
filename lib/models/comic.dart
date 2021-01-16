class Comic {
  final int id;
  final String titulo;
  final String descricao;

  Comic({this.id, this.titulo, this.descricao});

  get getId => this.id;
  get getTitulo => this.titulo;
  get getDescricao => this.descricao;

  factory Comic.fromJson(Map<String, dynamic> json) {
    return Comic(
        id: json['id'],
        titulo: json['title'].toString(),
        descricao: json['description'].toString());
  }
}
