class Anotacao{
  final String uid;
  final String titulo;
  final String descricao;

  Anotacao(this.uid, this.titulo, this.descricao);

  Map<String, dynamic> toJson(){
    return <String, dynamic>{
      'uid': uid,
      'titulo': titulo,
      'descricao': descricao
    };
  }

  factory Anotacao.fromJson(Map<String, dynamic> json) {
    return Anotacao(
      json['uid'],
      json['titulo'],
      json['descricao'],
    );
  }
}