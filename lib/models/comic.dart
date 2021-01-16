class Comic {
  final int id;
  final String titulo;
  final String descricao;
  final String thumb;
  final String serie;

  Comic({this.id, this.titulo, this.descricao, this.thumb, this.serie});

  get getId => this.id;
  get getTitulo => this.titulo;
  get getDescricao => this.descricao;
  get getThumb => this.thumb;
  get getSerie => this.serie;

  factory Comic.fromJson(Map<String, dynamic> json) {
    final parseThumb = json['thumbnail'];
    final parsePath = parseThumb['path'].replaceAll("http", "https");
    final parseSerie = json['series'];
    final parseSerieName = parseSerie['name'];
    return Comic(
        id: json['id'],
        titulo: json['title'].toString(),
        descricao: json['description'].toString(),
        thumb: parsePath,
        serie: parseSerieName,
    );
  }
}
