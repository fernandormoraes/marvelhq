class Creator {
  final int id;
  final String nome;

  Creator({this.id, this.nome});

  get getId => this.id;
  get getNome => this.nome;

  factory Creator.fromJson(Map<String, dynamic> json) {
    return Creator(
        id: json['id'],
        nome: json['fullName'].toString());
  }
}
