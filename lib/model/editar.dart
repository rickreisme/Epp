class Editar{
  final String uid;
  final String novoNome;
  final String novoSobrenome;

  Editar(this.uid, this.novoNome, this.novoSobrenome);

  Map<String, dynamic> toJson(){
    return <String, dynamic>{
      'uid': uid,
      'novoNome': novoNome,
      'novoSobrenome': novoSobrenome
    };
  }

  factory Editar.fromJson(Map<String, dynamic> json) {
    return Editar(
      json['uid'],
      json['nome'],
      json['sobrenome'],
    );
  }
}