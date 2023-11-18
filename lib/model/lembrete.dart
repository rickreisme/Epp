class Lembrete{
  final String uid;
  final String lemb;

  Lembrete(this.uid, this.lemb);

  Map<String, dynamic> toJson(){
    return <String, dynamic>{
      'uid': uid,
      'lemb': lemb
    };
  }

  factory Lembrete.fromJson(Map<String, dynamic> json) {
    return Lembrete(
      json['uid'],
      json['lemb'],
    );
  }
}